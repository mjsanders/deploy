# My DeployStudio scripts#
Here are some scripts that I use for Deployment and DeployStudio
Most are targeted at my special situation where I boot and deploy from a local partition (disk0s2)
and use DeployStudio to restore the rest of the disk.
These are mac's used in training classes where the

new and old (parts of scripts some are from 10.7)

### delete_FV2.sh###
deletes the CoreStorage volumes of a local disk (after training)
delete_FV2a.sh is an improved version that deletes volume, regardless of their partitionnumber

### mjs_reboot.sh###
will set the boot volume (since 1.3 with systemsetup) and reboot to a local disk

### PrepareforRestore.sh###
will restore the rest of the disk, regardless of the state, to a situation where the Runtime can restore an AutoDMG image with SIP enabled.

Maurits
======
