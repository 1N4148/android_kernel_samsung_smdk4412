#!/bin/sh
export KERNELDIR=`readlink -f .`

cd $KERNELDIR;

echo "Building I9300 .....";
./bk_i9300.sh && sleep 10

echo "Building N7105 .....";
./bk_n7105.sh && sleep 10


