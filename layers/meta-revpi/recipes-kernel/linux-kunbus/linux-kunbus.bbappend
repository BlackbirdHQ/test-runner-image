# inherit kernel-resin

FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI:append = " file://linux-kernel.cfg "
KERNEL_CONFIG_FRAGMENTS:append = "${WORKDIR}/linux-kernel.cfg "


# Set console accordingly to build type
CMDLINE = "dwc_otg.lpm_enable=0 rootwait"
CMDLINE += "${@bb.utils.contains('DISTRO_FEATURES','osdev-image',"console=tty1 console=serial0,115200"," vt.global_cursor_default=0 console=null",d)}"
CMDLINE_DEBUG = ""

KERNEL_MODULE_PROBECONF += "rtl8192cu"
module_conf:rtl8192cu = "blacklist rtl8192cu"

# revpi-connect was previously added on overlay2,
# so only the core 3 needs to include this module
# further.
# BALENA_CONFIGS:append:revpi-core-3 = " aufs"

python do_overlays() {
    import glob, re
    overlays = []
    source_path = d.getVar('S', True) + '/arch/' + d.getVar('ARCH',True) + '/boot/dts/overlays/*-overlay.dts'
    for overlay in glob.glob(source_path):
        overlays.append(re.sub(r'-overlay.dts','.dtbo',overlay).split('dts/')[-1])
    for dtbo in overlays:
        d.setVar('KERNEL_DEVICETREE', d.getVar('KERNEL_DEVICETREE', True) + ' ' + dtbo)

    f = open(d.getVar('DEPLOY_DIR_IMAGE') + '/overlays.txt', "w")
    f.write(d.getVar('KERNEL_DEVICETREE', True))
    f.close
}

# KERNEL_DEVICETREE has a local scope in each function, even in a :prepend,
# so the only way to alter it to include all overlays is by using the prefuncs
do_install[prefuncs] += "do_overlays"
do_compile[prefuncs] += "do_overlays"
do_deploy[prefuncs] += "do_overlays"

# we have to ensure the overlays list is populated so that
# the boot partition can be generated correctly
do_install[nostamp] = "1"
