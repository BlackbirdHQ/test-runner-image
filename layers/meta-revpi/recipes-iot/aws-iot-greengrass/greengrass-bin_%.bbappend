
FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " \
    file://config.yaml \
"

SYSTEMD_AUTO_ENABLE = "disable"

do_install:append() {
    install -d ${GG_ROOT}/auth
    
    install -m 0640 ${WORKDIR}/config.yaml ${GG_ROOT}/config/config.yaml.clean

    sed -i -e "s,##private_key##,/${GG_BASENAME}/auth/private.pem.key,g" ${GG_ROOT}/config/config.yaml.clean
    sed -i -e "s,##certificate_path##,/${GG_BASENAME}/auth/device.pem.crt,g" ${GG_ROOT}/config/config.yaml.clean
    sed -i -e "s,##root_ca##,/${GG_BASENAME}/auth/AmazonRootCA1.pem,g" ${GG_ROOT}/config/config.yaml.clean
    sed -i -e "s,##aws_region##,${GGV2_REGION},g" ${GG_ROOT}/config/config.yaml.clean
    sed -i -e "s,##role_alias##,${GGV2_ROLEALIAS},g" ${GG_ROOT}/config/config.yaml.clean
    sed -i -e "s,##posixUser##,ggc_user:ggc_group,g" ${GG_ROOT}/config/config.yaml.clean
}
