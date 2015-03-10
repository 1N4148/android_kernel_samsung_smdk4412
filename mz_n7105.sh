#!/bin/sh

export KERNELDIR=`readlink -f .`
export ARCHIVE=$KERNELDIR/installer
ZIP=/media/nas/Intenso-UltraLine-01/Android

NOW=$(date +"%Y%m%d-%H%M")

echo "Bundling installer for N7105"

cd $ARCHIVE/N7105

rm system/lib/modules/*.ko
rm bs/bootimg/zImage

cp $KERNELDIR/BUILT_N7105/zImage bs/bootimg/zImage
cp $KERNELDIR/BUILT_N7105/lib/modules/*.ko system/lib/modules/

zip -r $ZIP/N7105/1N4148-kernel-N7105-$NOW.zip *

cd ..
echo "finished"

