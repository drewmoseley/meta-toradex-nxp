# Extends the core u-boot recipe 
# to take the u-boot sources including the colibri stuff from our git repository
PR ="r5"
DEPENDS += "dtc-native"
 
FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

COMPATIBLE_MACHINE_colibri-t20 = "colibri-t20"
COMPATIBLE_MACHINE_colibri-t30 = "colibri-t30"

DEFAULT_PREFERENCE_colibri-t20 = "1"
DEFAULT_PREFERENCE_colibri-t30 = "1"

UBOOT_MACHINE_colibri-t20 = "colibri_t20_config"
UBOOT_MACHINE_colibri-t30 = "colibri_t30_config"

FILESPATHPKG =. "git:"
S="${WORKDIR}/git"
SRC_URI_COLIBRI = "git://git.toradex.com/u-boot-toradex.git;protocol=git;branch=colibri"
SRCREV_COLIBRI = "a364c856e063d8e62d277be1fd051cd3fce0571c"

PV_colibri-t20 = "${PR}+gitr${SRCREV}"
PV_colibri-t30 = "${PR}+gitr${SRCREV}"

SRC_URI_colibri-t20 = "${SRC_URI_COLIBRI}"
SRC_URI_colibri-t30 = "${SRC_URI_COLIBRI}"
SRCREV_colibri-t20 = "${SRCREV_COLIBRI}"
SRCREV_colibri-t30 = "${SRCREV_COLIBRI}"
PV_colibri-t20 = "${PR}+gitr${SRCREV}"
PV_colibri-t30 = "${PR}+gitr${SRCREV}"

# override the solution passed in from u-boot.inc as we want to set additional flags
EXTRA_OEMAKE_colibri-t20 = "CROSS_COMPILE=${TARGET_PREFIX}"
EXTRA_OEMAKE_colibri-t30 = "CROSS_COMPILE=${TARGET_PREFIX}"

#build additionally a u-boot binary which uses/stores its environment on an T20 external sd or mmc card
SPL_BINARY_colibri-t20  = "u-boot-hsmmc.bin"
SPL_IMAGE_colibri-t20   = "u-boot-hsmmc-${MACHINE}-${PV}-${PR}.${UBOOT_SUFFIX}"
SPL_SYMLINK_colibri-t20 = "u-boot-hsmmc-${MACHINE}.${UBOOT_SUFFIX}"
do_compile_append_colibri-t20() {
	mv u-boot.bin u-boot-nand.bin
	oe_runmake colibri_t20_sdboot_config
	oe_runmake all
	mv u-boot.bin u-boot-hsmmc.bin
	mv u-boot-nand.bin u-boot.bin
}
