#!/bin/bash

# $1 is the package resources folder
# $3 is the installer destination (usually /)

LOGGER="/usr/bin/logger"
MUNKI_REPO_URL="http://munkimain.pretendco.com/"
MUNKI_CLIENT_IDENT=“test_munki_client”
MUNKI_CONFIG_FILE=“/private/var/root/Library/Preferences/ManagedInstalls”

 
# Determine working directory
 
install_dir=`dirname $0`

# Install Munki 

/usr/sbin/installer -pkg $install_dir/munkitools-2.2.4.2431.pkg -target $3
 
exit 0

/bin/echo "setting Munki Repo URL at $3/private/var/root/Library/Preferences/ManagedInstalls defaults to $MUNKI_REPO_URL"
/bin/echo "setting Munki Repo URL at $3/private/var/root/Library/Preferences/ManagedInstalls defaults to $MUNKI_CLIENT_IDENT"

/usr/bin/defaults write "$3/private/var/root/Library/Preferences/ManagedInstalls" SoftwareRepoURL $MUNKI_REPO_URL
/usr/bin/defaults write "$3/private/var/root/Library/Preferences/ManagedInstalls" ClientIdentifier $MUNKI_CLIENT_IDENT
/usr/bin/defaults write "$3/private/var/root/Library/Preferences/ManagedInstalls" InstallAppleSoftwareUpdates -bool True

/usr/bin/touch "$3/Users/Shared/.com.googlecode.munki.checkandinstallatstartup"

exit 0
