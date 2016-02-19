#/bin/sh
#created by maurits@lai.nl for internal use in training macbooks
#The ds_finalize.sh scripts always disables icloud setup, which we do not like in training
#so we undo these stept of this script as a postphone task
#We do not edit this script since it will be added with any DeployStudio update

# disable iCloud and gestures demos, changed defaults write to defaults delete
echo "  "
echo "  deleted the defaults write commands for iCloud" for LAI
echo "  "
if [ `sw_vers -productVersion | awk -F. '{ print $2 }'` -ge 7 ]
then
  SYS_VERS=`sw_vers -productVersion`

  defaults delete /Library/Preferences/com.apple.SetupAssistant RegisteredVersion

  for USER_TEMPLATE in "/System/Library/User Template"/*
  do
    rm "${USER_TEMPLATE}"/Library/Preferences/com.apple.SetupAssistant.plist
  done

  for USER_HOME in /Users/*
  do
    USER_UID=`basename "${USER_HOME}"`
    if [ ! "${USER_UID}" = "Shared" ] 
    then 
      if [ ! -d "${USER_HOME}"/Library/Preferences ]
      then
        mkdir -p "${USER_HOME}"/Library/Preferences
        chown "${USER_UID}" "${USER_HOME}"/Library
        chown "${USER_UID}" "${USER_HOME}"/Library/Preferences
      fi
      if [ -d "${USER_HOME}"/Library/Preferences ]
      then
        rm "${USER_HOME}"/Library/Preferences/com.apple.SetupAssistant.plist
      fi
    fi
  done
fi
echo "  "
echo "  deleted the com.apple.SetupAssistant.plist files for iCloud"
echo "  "
