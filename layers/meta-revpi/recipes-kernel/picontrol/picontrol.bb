SUMMARY = "Kunbus PiControl kernel module"
LICENSE = "GPL-2.0-only"
LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7"

inherit module

SRC_URI = " \
	git://github.com/RevolutionPi/piControl;protocol=https;nobranch=1; \
	file://0001-Use-modules_install-as-wanted-by-yocto.patch \
	file://0002-Debug-serial-comm.patch \
	file://config.rsc \
    file://50-revpi.rules \    
    file://pileft-quirks.service \    
    file://piright-quirks.service \    
    file://pibridge-shutdown \    
"

# Commit for raspberrypi-kernel_1%9.20221118-5.10.152+revpi1
SRCREV ="0d76e6f08a50615d15fd7a4b8482fb028cc3f18c"


S = "${WORKDIR}/git"

TARGET_CFLAGS += " -I${S} -D__KUNBUSPI_KERNEL__ "
TARGET_CC_ARCH += "${LDFLAGS}"

EXTRA_OEMAKE:append = " KDIR=${STAGING_KERNEL_DIR}"

FILES:${PN} += " \
    ${bindir}/piTest \
    ${bindir}/piControlReset \
    ${sysconfdir}/revpi/config.rsc__ \
    /lib/udev/rules.d/50-revpi.rules \
    /lib/systemd/system/pileft.service \
    /lib/systemd/system/piright.service \
    ${sbindir}/pibridge-shutdown \
"

do_compile:append() {
	oe_runmake -C ${S}/piTest piTest
}

do_install:append() {
	oe_runmake -C ${S}/piTest DESTDIR=${D} install

    install -d ${D}${sysconfdir}/revpi
    install -m 0644 ${WORKDIR}/config.rsc ${D}/${sysconfdir}/revpi/config.rsc__

	install -d ${D}/lib/udev/rules.d
	install -d ${D}/lib/systemd/system
	install -d ${D}${sbindir}

    install -m 0644 ${WORKDIR}/50-revpi.rules ${D}/lib/udev/rules.d/
    install -m 0644 ${WORKDIR}/pileft-quirks.service ${D}/lib/systemd/system/pileft.service
    install -m 0644 ${WORKDIR}/piright-quirks.service ${D}/lib/systemd/system/piright.service
    install -m 0755 ${WORKDIR}/pibridge-shutdown ${D}${sbindir}/pibridge-shutdown
}