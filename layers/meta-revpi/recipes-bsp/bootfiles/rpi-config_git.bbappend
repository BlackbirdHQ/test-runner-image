do_deploy:append() {
    # Enable i2c by default
    echo "dtparam=i2c_arm=on" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    # Enable SPI by default
    echo "dtparam=spi=on" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    # Disable firmware splash by default
    echo "disable_splash=1" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    # Disable firmware warnings showing in non-debug images
    if ! ${@bb.utils.contains('DISTRO_FEATURES','osdev-image','true','false',d)}; then
        echo "avoid_warnings=1" >>${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
    fi
    # Enable audio (loads snd_bcm2835)
    echo "dtparam=audio=on" >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}

do_deploy:append:revpi-core-3() {
    cat >> ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt << EOF

# serial port needs to be kept clean for RS485 communication
avoid_warnings=1

dtoverlay=revpi-core

EOF
    # prevent u-boot logging on uart
    sed -i 's/enable_uart=1//' ${DEPLOYDIR}/${BOOTFILES_DIR_NAME}/config.txt
}

# On Raspberry Pi 3 and Raspberry Pi Zero WiFi, serial ttyS0 console is only
# usable if ENABLE_UART = 1. On OS development images, we want serial console
# available, production devices can enable it with a configuration variable.
ENABLE_UART ?= "${@bb.utils.contains('DISTRO_FEATURES','osdev-image','1','0',d)}"
