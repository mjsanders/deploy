#!/bin/sh
# Edited by maurits.sanders@lai.nl 31 aug 2009
# based on ds_example.sh from deploystudio
# Assumes that on the DSS Repository there is a folder Copy_to_Client
# in this folder the same folder structure as the Repository should be created
# rsync is not on the netboot set, so I copied rsync to the #Scripts/ folder

# Maurits Variables defined here below

echo "ds_copy_folder.sh - v0.1 ("`date`")"
DS_Local_Rep_Path=/Volumes/Restore6/Users/Shared/DeployStudio

# default Variables
#
# DS_USER_LOGIN,
# DS_REPOSITORY_PATH="/Shared Items/Deploy_Repository/"
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


echo 'DS_USER_LOGIN                  =('${DS_USER_LOGIN}')'
echo 'DS_REPOSITORY_PATH             =('${DS_REPOSITORY_PATH}')'
echo 'DS_LAST_RESTORED_VOLUME        =('${DS_LAST_RESTORED_VOLUME}')'
echo 'DS_LAST_RESTORED_DEVICE        =('${DS_LAST_RESTORED_DEVICE}')'
echo 'DS_LAST_IMAGED_VOLUME_FILE_NAME=('${DS_LAST_IMAGED_VOLUME_FILE_NAME}')'
echo 'DS_BOOT_DEVICE                 =('${DS_BOOT_DEVICE}')'
echo 'DS_STARTUP_VOLUME              =('${DS_STARTUP_VOLUME}')'
echo 'DS_HOSTNAME                    =('${DS_HOSTNAME}')'
echo 'DS_COMPUTERNAME                =('${DS_COMPUTERNAME}')'
echo 'DS_PRIMARY_MAC_ADDRESS         =('${DS_PRIMARY_MAC_ADDRESS}')'
echo 'DS_ASSIGNED_IP_ADDRESS         =('${DS_ASSIGNED_IP_ADDRESS}')'
echo 'DS_Local_Rep_Path              =('${DS_Local_Rep_Path}')'

# Maurits script defined here below

#echo "ls -lR "$DS_REPOSITORY_PATH/Copy_to_Client" "
#ls -lR "$DS_REPOSITORY_PATH/Copy_to_Client"
#cp -nrv "$DS_REPOSITORY_PATH/Copy_to_Client"  "$DS_Local_Rep_Path/"
# rsync is better in showing progress than cp

"$DS_REPOSITORY_PATH/Scripts/rsync" rsync -avhE --ignore-existing --exclude=".*" --progress "$DS_REPOSITORY_PATH/Copy_to_Client"  "$DS_Local_Rep_Path/"

#rm "$DS_Local_Rep_Path/Masters/keyword.plist"
# this step does not seem to be needed ?

# Maurits script ends here


#
# Echo a message with the prefix RuntimeAbortWorkflow to alert
# DeployStudio Runtime that the workflow should be aborted.
#
# Example:
#
if [ "_${error}" = "_1" ]; then
   echo "RuntimeAbortWorkflow: Error in script ds_copy_folder.sh"
fi

echo "ds_copy_folder.sh - end"

exit 0
