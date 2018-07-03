#!/bin/bash

DIST="${1}"

if [ ! -d out ] ; then
    mkdir out
fi

set -e

function buildpkg {
    if [ ! -f "out/${1}" ] ; then
        cd "${2}"
        set +e
        QUILT_PATCHES=$(pwd)/debian/patches quilt push -a
        set -e
        dpkg-buildpackage -b -us -uc
        cd ..
        mv *.deb out/
    fi
}

echo "Building NJSM mailserver addons on $(uname -a)"
echo "Target: $(cat /etc/os-release)"

# C++
buildpkg folly-dev_0.57_amd64.deb folly
dpkg -i out/folly-dev_0.57_amd64.deb
buildpkg wangle-dev_0.57_amd64.deb wangle
dpkg -i out/wangle-dev_0.57_amd64.deb
buildpkg mcrouter_0.57_amd64.deb mcrouter

# Perl
buildpkg spamassassin-plugin-sagrey_0.1-1_all.deb sagrey
# vim: set ts=4 sw=4 tw=0 et :
