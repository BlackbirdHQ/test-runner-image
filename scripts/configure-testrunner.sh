#!/bin/bash

if [ $# -le 1 ]; then
    echo "Usage: $0 <IP address> <Thing name>"
    exit 1
fi

IP=$1
THING_NAME=$2


GG_BASE="/greengrass/v2"

ACC_ID=$(aws sts get-caller-identity --query "Account" --output text | cat)

if [ "$ACC_ID" != "274906834921" ]; then
    echo "Script requires mgmt account credentials in scope. Please run 'assume mgmt' and try again"
    exit 1
fi


echo "Configuring test-runner on IP address: $IP, to ThingName: $THING_NAME"

ssh -q root@$IP exit
if [ $? != "0" ]; then
    echo "No connection to IP: $IP"
    exit 1
fi

echo "Cleaning up existing certificates for $THING_NAME"
aws iot list-thing-principals --thing-name $THING_NAME | jq -r '.principals[]' | while read object; do
    CERT_ARN=$object
    echo "Deleting existing certificate: $CERT_ARN"
    aws iot detach-thing-principal --thing-name $THING_NAME --principal $CERT_ARN
    CERT_ID=$(echo $CERT_ARN | cut -d "/" -f 2)
    aws iot update-certificate --certificate-id $CERT_ID --new-status INACTIVE
    
    aws iot detach-policy --policy-name "GreengrassCoreTokenExchangeRoleAliasPolicy" --target $CERT_ARN
    aws iot detach-policy --policy-name "ActionRunnerIoTThingPolicy" --target $CERT_ARN
    
    aws iot delete-certificate --certificate-id $CERT_ID
done


TMP_CERT_DIR=$(mktemp -d)
CERT_ARN=$(aws iot create-keys-and-certificate --set-as-active --certificate-pem-outfile $TMP_CERT_DIR/device.pem.crt --public-key-outfile $TMP_CERT_DIR/public.pem.key --private-key-outfile $TMP_CERT_DIR/private.pem.key --query 'certificateArn' --output text)

# Attach policies to certificate
aws iot attach-policy --policy-name "GreengrassCoreTokenExchangeRoleAliasPolicy" --target $CERT_ARN
aws iot attach-policy --policy-name "ActionRunnerIoTThingPolicy" --target $CERT_ARN

aws iot attach-thing-principal --thing-name $THING_NAME --principal $CERT_ARN
echo "Created new certificate for $THING_NAME: $CERT_ARN"

curl -o $TMP_CERT_DIR/AmazonRootCA1.pem https://www.amazontrust.com/repository/AmazonRootCA1.pem

echo "Transferring certificates to device with IP: $IP"
scp -r $TMP_CERT_DIR/* root@$IP:$GG_BASE/auth/

DATA_ENDPOINT=$(aws iot describe-endpoint --endpoint-type iot:Data-ATS --query 'endpointAddress' --output text)
CRED_ENDPOINT=$(aws iot describe-endpoint --endpoint-type iot:CredentialProvider --query 'endpointAddress' --output text)

ssh root@$IP "cp $GG_BASE/config/config.yaml.clean $GG_BASE/config/config.yaml"
ssh root@$IP "sed -i 's/##thing_name##/$THING_NAME/g' $GG_BASE/config/config.yaml"
ssh root@$IP "sed -i 's/##iot_cred_endpoint##/$CRED_ENDPOINT/g' $GG_BASE/config/config.yaml"
ssh root@$IP "sed -i 's/##iot_data_endpoint##/$DATA_ENDPOINT/g' $GG_BASE/config/config.yaml"


ssh root@$IP "chmod 0440 $GG_BASE/auth/device.pem.crt"
ssh root@$IP "chmod 0440 $GG_BASE/auth/public.pem.key"
ssh root@$IP "chmod 0440 $GG_BASE/auth/private.pem.key"
ssh root@$IP "chmod 0440 $GG_BASE/auth/AmazonRootCA1.pem"


rm -r $TMP_CERT_DIR

echo "Setting device hostname to '$THING_NAME'"
ssh root@$IP "hostnamectl set-hostname $THING_NAME"

echo "Done configuring Greengrass device. Starting Greengrass service.."
ssh root@$IP "systemctl enable greengrass && systemctl start greengrass"
