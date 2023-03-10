FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"


SRC_URI:append = " \
    file://0002-nss-fix-support-cross-compiling.patch \
"
