PV = "6.2.4.p4.8"
SRC_URI[aarch64.md5sum] = "004be10d7ee734e78fb2bcfc6604a425"
SRC_URI[aarch64.sha256sum] = "80e6a08c94fa9c391fa9eca0d33a76409c21ede665d47e4494c01e6d2960e735"
SRC_URI[arm.md5sum] = "98f931ba413f5674e14420751a58a200"
SRC_URI[arm.sha256sum] = "f2995229f64db919ab3e2bba94b091b31480e30963dc46e8e0b851eca945ea2c"
LIC_FILES_CHKSUM = "file://COPYING;md5=fd4b227530cd88a82af6a5982cfb724d"
FSLBIN_NAME_arm = "${PN}-${PV}-arm"
# implement that this is not for COMPATIBLE_MACHINE_imxdpu
COMPATIBLE_MACHINE_2D          = "(^$)"
COMPATIBLE_MACHINE_2D_imxgpu2d = "${MACHINE}"
COMPATIBLE_MACHINE             = "${COMPATIBLE_MACHINE_2D}"
COMPATIBLE_MACHINE_imxdpu      = "(^$)"