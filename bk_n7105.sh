#!/bin/sh
export KERNELDIR=`readlink -f .`

GCC_VERSION=4.9
GCC_TOOLCHAIN=Linaro

export USE_CCACHE=1
export CROSS_DIR=/android/arm-cortex_a9-linux-gnueabihf-linaro_4.9.3-2014.11/bin
export CROSS_COMPILE=$CROSS_DIR/arm-eabi-
export ARM_CROSS_COMPILE=$CROSS_COMPILE
export ARCH=arm

make defconfig cm_t0lte_defconfig

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

