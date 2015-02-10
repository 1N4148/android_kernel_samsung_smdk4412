#!/bin/sh

BUILD=/android/android_kernel_smdk4412/kernel
ARCHIVE=$BUILD/installer
ZIP=/mnt/Intenso-UltraLine-01/Android

NOW=$(date +"%Y%m%d-%H%M")

echo "Bundling installer for N7105"

cd $ARCHIVE/n7105

rm system/lib/modules/*.ko
rm bs/bootimg/zImage

cp $BUILD/BUILT_N7105/zImage bs/bootimg/zImage
cp $BUILD/BUILT_N7105/lib/modules/*.ko system/lib/modules/

zip -r $ZIP/N7105/1N4148-kernel-N7105-$NOW.zip *

cd ..
echo "finished"

