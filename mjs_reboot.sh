#!/bin/sh

echo "mjs_reboot.sh - v1.2 ("`date`")"

#
# DS_USER_LOGIN,
# DS_REPOSITORY_PATH,
# DS_LAST_RESTORED_VOLUME,
# DS_LAST_RESTORED_DEVICE,
# DS_LAST_IMAGED_VOLUME_FILE_NAME,
# DS_BOOT_DEVICE,
# DS_STARTUP_VOLUME,
# DS_HOSTNAME,
# DS_COMPUTERNAME,
# DS_PRIMARY_MAC_ADDRESS,
# DS_ASSIGNED_IP_ADDRESS,
# DS_ASSIGNED_SUBNET,
# DS_ASSIGNED_ROUTER,
# DS_ASSIGNED_HOSTNAME,
# DS_ASSIGNED_DNS,
# DS_ASSIGNED_DOMAIN,
# DS_SUPERDRIVE are environment variables defined by DeployStudio Server Runtime

# echo 'DS_USER_LOGIN                  =('${DS_USER_LOGIN}')'
# echo 'DS_REPOSITORY_PATH             =('${DS_REPOSITORY_PATH}')'
echo 'DS_LAST_RESTORED_VOLUME        =('${DS_LAST_RESTORED_VOLUME}')'
echo 'DS_LAST_RESTORED_DEVICE        =('${DS_LAST_RESTORED_DEVICE}')'
echo 'DS_LAST_IMAGED_VOLUME_FILE_NAME=('${DS_LAST_IMAGED_VOLUME_FILE_NAME}')'
echo 'DS_BOOT_DEVICE                 =('${DS_BOOT_DEVICE}')'
echo 'DS_STARTUP_VOLUME              =('${DS_STARTUP_VOLUME}')'
# echo 'DS_HOSTNAME                    =('${DS_HOSTNAME}')'
# echo 'DS_COMPUTERNAME                =('${DS_COMPUTERNAME}')'
# echo 'DS_PRIMARY_MAC_ADDRESS         =('${DS_PRIMARY_MAC_ADDRESS}')'
# echo 'DS_ASSIGNED_IP_ADDRESS         =('${DS_ASSIGNED_IP_ADDRESS}')'
# echo 'DS_ASSIGNED_SUBNET             =('${DS_ASSIGNED_SUBNET}')'
# echo 'DS_ASSIGNED_ROUTER             =('${DS_ASSIGNED_ROUTER}')'
# echo 'DS_ASSIGNED_HOSTNAME           =('${DS_ASSIGNED_HOSTNAME}')'
# echo 'DS_ASSIGNED_DNS                =('${DS_ASSIGNED_DNS}')'
# echo 'DS_ASSIGNED_DOMAIN             =('${DS_ASSIGNED_DOMAIN}')'
# echo 'DS_SUPERDRIVE                  =('${DS_SUPERDRIVE}')'

/bin/echo 'sleep 2'
/bin/sleep 2

/usr/sbin/bless --device $DS_LAST_RESTORED_DEVICE --setBoot
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
