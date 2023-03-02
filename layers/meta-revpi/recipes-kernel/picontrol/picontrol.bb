SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/RevolutionPi/piControl;protocol=https;nobranch=1; \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://config.rsc \
"

# Commit for raspberrypi-kernel_1%9.20221118-5.10.152+revpi1
SRCREV ="f6a3014af983caeae09318e6379e543b43d1c356"


S = "${WORKDIR}/git"

TARGET_CFLAGS += " -I${S} -D__KUNBUSPI_KERNEL__ "
TARGET_CC_ARCH += "${LDFLAGS}"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"

FILES:${PN} += " \
    ${bindir}/piTest \
    ${bindir}/piControlReset \
    /etc/revpi/config.rsc \
"

do_compile:append() {
	oe_runmake -C ${S}/piTest piTest
}

do_install:append() {
	oe_runmake -C ${S}/piTest DESTDIR=${D} install

    install -d ${D}${sysconfdir}/revpi
    install -m 0644 ${WORKDIR}/config.rsc ${D}/${sysconfdir}/revpi
}