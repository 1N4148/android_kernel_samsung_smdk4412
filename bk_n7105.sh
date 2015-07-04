#!/bin/sh
export KERNELDIR=`readlink -f .`

make defconfig psn_n7105_new_defconfig

. $KERNELDIR/.config

mv .git .git-halt

cd $KERNELDIR/
make -j4 || exit 1

mkdir -p $KERNELDIR/BUILT_N7105/lib/modules

rm $KERNELDIR/BUILT_N7105/lib/modules/*
rm $KERNELDIR/BUILT_N7105/zImage

find -name '*.ko' -exec cp -av {} $KERNELDIR/BUILT_N7105/lib/modules/ \;
${CROSS_COMPILE}strip --strip-unneeded $KERNELDIR/BUILT_N7105/lib/modules/*
cp $KERNELDIR/arch/arm/boot/zImage $KERNELDIR/BUILT_N7105/

mv .git-halt .git

