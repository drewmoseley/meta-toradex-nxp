# Copyright (C) 2016 Toradex AG
# Released under the MIT license (see COPYING.MIT for the terms)

SUMMARY = "Deploys Vivante GPU libraries, even if no package RDEPENDS on them"
COMPATIBLE_MACHINE = "(apalis*|colibri*|verdin*)"

PACKAGE_ARCH = "${MACHINE_ARCH}"

inherit packagegroup

RDEPENDS_${PN} = " \
    libgal-imx \
    libegl-imx \
    libgl-imx \
    libgles-imx \
    libgles2-imx \
    libopenvg-imx \
    libvdk-imx \
    ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', '', \
       bb.utils.contains('DISTRO_FEATURES',     'x11', 'xserver-xorg-extension-viv-autohdmi', \
                                                       '', d), d)} \
"
