#!/bin/sh

export KERNELDIR=`readlink -f .`
export ARCHIVE=$KERNELDIR/installer
ZIP=/media/nas/Intenso-UltraLine-01/Android

NOW=$(date +"%Y%m%d-%H%M")

echo "Bundling installer for I9300"

cd $ARCHIVE/I9300

rm system/lib/modules/*.ko
rm bs/bootimg/zImage

cp $KERNELDIR/BUILT_I9300/zImage bs/bootimg/zImage
cp $KERNELDIR/BUILT_I9300/lib/modules/*.ko system/lib/modules/

zip -r $ZIP/I9300/1N4148-kernel-I9300-$NOW.zip *

cd ..
echo "finished"

