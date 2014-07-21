#!/bin/bash
#
# Copied from https://raw.github.com/dotcloud/docker/master/hack/vendor.sh
#
# Apache Licensed https://github.com/dotcloud/docker/blob/master/LICENSE
#

set -ex

# Downloads dependencies into vendor directory
if [[ ! -d /vendor/src ]]; then
  mkdir -p /vendor/src
fi

vendor_dir=/vendor/src

hg_clone () {
    PKG=$1
    REV=$2
    (
        set -ex
        cd $vendor_dir
        if [[ -d $PKG ]]; then
            echo "$PKG already exists. Removing."
            rm -fr $PKG
        fi
        cd $vendor_dir && hg clone http://$PKG $PKG
        cd $PKG && hg update --clean --rev $REV && rm -fr .hg
    )
}

git_clone () {
  PKG=$1
  REV=$2
  (
    set -ex
    cd $vendor_dir
    if [[ -d $PKG ]]; then
      echo "$PKG already exists. Removing."
      rm -fr $PKG
    fi
    cd $vendor_dir && git clone http://$PKG $PKG
    cd $PKG && git checkout -f $REV && rm -fr .git
  )
}

git_clone github.com/pebbe/zmq4 080ec4ea6ecfa426c45cebdc99cfc7d11c085579
go install github.com/pebbe/zmq4

exit 0