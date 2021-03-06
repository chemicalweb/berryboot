#############################################################
#
# Open-ISCSI
#
#############################################################


OPENISCSI_VERSION=dd73b7d12b
OPENISCSI_SITE=git://github.com/mikechristie/open-iscsi.git
OPENISCSI_INSTALL_STAGING = YES
OPENISCSI_INSTALL_TARGET = NO
OPENISCSI_DEPENDENCIES=

define OPENISCSI_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/utils/sysdeps
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/utils/fwparam_ibft
	$(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D)/usr iscsistart
endef

define OPENISCSI_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0755 $(@D)/usr/iscsistart $(STAGING_DIR)/sbin
endef

$(eval $(call GENTARGETS))
