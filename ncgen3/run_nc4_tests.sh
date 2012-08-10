#!/bin/sh
# This shell script runs the ncdump tests.
# $Id: run_nc4_tests.sh,v 1.3 2009/09/24 18:19:10 dmh Exp $
srcdir=`dirname $0`
cd $srcdir
srcdir=`pwd`

# compute the build directory
builddir=`pwd`/..
# Hack for CYGWIN
cd $srcdir
if [ `uname | cut -d "_" -f 1` = "MINGW32" ]; then
    srcdir=`pwd | sed 's/\/c\//c:\//g'`
    builddir="$srcdir"/..
fi

echo "*** Testing ncgen3 for netCDF-4."
set -e
echo "*** creating netCDF-4 file c0_4.nc from c0.cdl..."
./ncgen3 -k3 -b -o c0_4.nc $srcdir/c0.cdl
echo "*** creating netCDF-4 classic model file c0_4c.nc from c0.cdl..."
./ncgen3 -k4 -b -o c0_4c.nc $srcdir/c0.cdl

echo "*** Test successful!"
exit 0
