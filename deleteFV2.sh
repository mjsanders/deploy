#/bin/sh
#created by maurits@lai.nl for internal use in training macbooks
#assumes that disk0s3 is the FileVault2 encrypted volume.
#will generate an empty volume named 'leeg' on disk0s3
LGV_UUID=`diskutil cs info disk0s3|grep LVG |awk '{ print $4; }'`
echo "  disk list is:" 
diskutil list
echo "  LVG UUID is:" $LGV_UUID
diskutil cs delete $LGV_UUID
diskutil eraseVolume JHFS+ leeg disk0s3
echo "  "
echo "  disk list after reformatted FileVault volume is:"
diskutil list
exit 0
