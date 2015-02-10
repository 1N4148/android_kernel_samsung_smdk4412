#!/bin/sh

BUILD=/android/android_kernel_smdk4412/kernel
ARCHIVE=$BUILD/installer
ZIP=/mnt/Intenso-UltraLine-01/Android

NOW=$(date +"%Y%m%d-%H%M")

echo "Bundling installer for I9300"

cd $ARCHIVE/i9300

rm system/lib/modules/*.ko
rm bs/bootimg/zImage

cp $BUILD/BUILT_I9300/zImage bs/bootimg/zImage
cp $BUILD/BUILT_I9300/lib/modules/*.ko system/lib/modules/

zip -r $ZIP/I9300/1N4148-kernel-I9300-$NOW.zip *

cd ..
echo "finished"

