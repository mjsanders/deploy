#!/bin/sh

echo "mjs_reboot.sh - v1.3 ("`date`")"
#1.3: from bless device to -setstartupdisk volume

echo 'DS_LAST_RESTORED_VOLUME        =('${DS_LAST_RESTORED_VOLUME}')'
echo 'DS_LAST_RESTORED_DEVICE        =('${DS_LAST_RESTORED_DEVICE}')'
echo 'DS_LAST_IMAGED_VOLUME_FILE_NAME=('${DS_LAST_IMAGED_VOLUME_FILE_NAME}')'
echo 'DS_BOOT_DEVICE                 =('${DS_BOOT_DEVICE}')'
echo 'DS_STARTUP_VOLUME              =('${DS_STARTUP_VOLUME}')'

/bin/echo 'sleep 2'
/bin/sleep 2

echo 'Will systemset -setstartupdisk '$DS_LAST_RESTORED_VOLUME''
/usr/sbin/systemsetup -setstartupdisk "/Volumes/$DS_LAST_RESTORED_VOLUME"
#/usr/sbin/bless --mount "/Volumes/$DS_LAST_RESTORED_VOLUME" --setBoot
/sbin/shutdown -r now

#
# Echo a message with the prefix RuntimeAbortWorkflow to alert
# DeployStudio Runtime that the workflow should be aborted.
#
# Example:
#
#if [ "_${error}" = "_1" ]; then
#   echo "RuntimeAbortWorkflow: message"
#fi

/bin/echo "mjs_reboot.sh - end"

exit 0
