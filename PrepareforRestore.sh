# /bin/bash
# created by maurits@lai.nl for internal use in training macbooks
# works (tested) only for internal drives (disk0)
# assumes default config: disk0s2 is Restore11 (current boot volume).
# will erase all other partitions 
# will create named 'leegsplit' on disk0s3 with room for recovery HD

echo " - "
echo " - disk list Before preparation is:" 
diskutil list 2>&1
echo " -  "

DISKUTIL_CS=`diskutil list|grep Apple_CoreStorage | awk '{ print $NF; }'`
echo " - DISKUTIL_CS is : " $DISKUTIL_CS

LGV_UUID=`diskutil cs list |grep "Logical Volume Group" |awk '{ print $NF; }'`
echo " - LVG UUID is:" $LGV_UUID

LISTOFSLICES=`diskutil list | grep : | grep disk0s | awk '{ print $NF; }'`
#echo " - LISTOFSLICES is : " $LISTOFSLICES


if [ "$DISKUTIL_CS" != "" ] ; then
echo " - CoreStorage found, deleting CS volume"
	diskutil cs delete $LGV_UUID 2>&1
	diskutil eraseVolume JHFS+ leeg $DISKUTIL_CS 2>&1
	echo " - done erase LVG"
	LAST_SLICE=`diskutil list|grep : |grep disk0s | awk ' END { print $NF; }'`
#	echo " - LAST_SLICE (cs) is : " $LAST_SLICE
	echo " - first merge $DISKUTIL_CS to $LAST_SLICE"
	echo y | diskutil mergePartitions force JHFS+ leeg disk0s3 $LAST_SLICE
	diskutil splitpartition disk0s3  JHFS+ leegsplit R %Apple_Boot% %noformat% %recovery% 2>&1
# looks silly to do split twice, but otherwise the last partition will be 2, 3 times 650 MB
else
	echo " - No CoreStorage volumes found"
fi

LISTOFSLICES=`diskutil list|grep disk0s | awk '{ print $NF; }'`
echo " - LISTOFSLICES is : " $LISTOFSLICES
LAST_SLICE=`diskutil list|grep disk0s | awk 'END { print $NF; }'`
echo " - LAST_SLICE is : " $LAST_SLICE

	echo " - Proceed to merge disk0s3 (again for CS) to $LAST_SLICE"
	echo y | diskutil mergePartitions force JHFS+ leeg disk0s3 $LAST_SLICE
	echo " - done merging"

echo " - creating room for recovery at end of disk0s3"
diskutil splitpartition disk0s3  JHFS+ leegsplit R %Apple_Boot% %noformat% %recovery% 2>&1


echo " -  "
echo " - PrepareforRestore.sh - end"

exit 0