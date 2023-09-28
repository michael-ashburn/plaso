#!/usr/bin/env bash
#
# Script to install plaso on Ubuntu from the GIFT PPA. Set the environment
# variable GIFT_PPA_TRACK if want to use a specific track. The default is dev.
#
# This file is generated by l2tdevtools update-dependencies.py any dependency
# related changes should be made in dependencies.ini.

# Exit on error.
set -e

GIFT_PPA_TRACK=${GIFT_PPA_TRACK:-dev}

export DEBIAN_FRONTEND=noninteractive

# Dependencies for running plaso, alphabetized, one per line.
# This should not include packages only required for testing or development.
PYTHON_DEPENDENCIES="libbde-python3
                     libcaes-python3
                     libcreg-python3
                     libesedb-python3
                     libevt-python3
                     libevtx-python3
                     libewf-python3
                     libfsapfs-python3
                     libfsext-python3
                     libfsfat-python3
                     libfshfs-python3
                     libfsntfs-python3
                     libfsxfs-python3
                     libfvde-python3
                     libfwnt-python3
                     libfwsi-python3
                     liblnk-python3
                     libluksde-python3
                     libmodi-python3
                     libmsiecf-python3
                     libolecf-python3
                     libphdi-python3
                     libqcow-python3
                     libregf-python3
                     libscca-python3
                     libsigscan-python3
                     libsmdev-python3
                     libsmraw-python3
                     libssl-dev
                     libvhdi-python3
                     libvmdk-python3
                     libvsgpt-python3
                     libvshadow-python3
                     libvslvm-python3
                     python3-acstore
                     python3-artifacts
                     python3-bencode
                     python3-certifi
                     python3-cffi-backend
                     python3-chardet
                     python3-cryptography
                     python3-dateutil
                     python3-defusedxml
                     python3-dfdatetime
                     python3-dfvfs
                     python3-dfwinreg
                     python3-dtfabric
                     python3-flor
                     python3-future
                     python3-idna
                     python3-lz4
                     python3-opensearch
                     python3-pefile
                     python3-psutil
                     python3-pyparsing
                     python3-pytsk3
                     python3-pyxattr
                     python3-redis
                     python3-requests
                     python3-six
                     python3-tz
                     python3-urllib3
                     python3-xlsxwriter
                     python3-yaml
                     python3-yara
                     python3-zmq
                     python3-zstd";

# Additional dependencies for running tests, alphabetized, one per line.
TEST_DEPENDENCIES="python3-distutils
                   python3-fakeredis
                   python3-mock
                   python3-setuptools";

# Additional dependencies for development, alphabetized, one per line.
DEVELOPMENT_DEPENDENCIES="pylint
                          python-sphinx";

# Additional dependencies for debugging, alphabetized, one per line.
DEBUG_DEPENDENCIES="libbde-dbg
                    libbde-python3-dbg
                    libcaes-dbg
                    libcaes-python3-dbg
                    libcreg-dbg
                    libcreg-python3-dbg
                    libesedb-dbg
                    libesedb-python3-dbg
                    libevt-dbg
                    libevt-python3-dbg
                    libevtx-dbg
                    libevtx-python3-dbg
                    libewf-dbg
                    libewf-python3-dbg
                    libfsapfs-dbg
                    libfsapfs-python3-dbg
                    libfsext-dbg
                    libfsext-python3-dbg
                    libfsfat-dbg
                    libfsfat-python3-dbg
                    libfshfs-dbg
                    libfshfs-python3-dbg
                    libfsntfs-dbg
                    libfsntfs-python3-dbg
                    libfsxfs-dbg
                    libfsxfs-python3-dbg
                    libfvde-dbg
                    libfvde-python3-dbg
                    libfwnt-dbg
                    libfwnt-python3-dbg
                    libfwsi-dbg
                    libfwsi-python3-dbg
                    liblnk-dbg
                    liblnk-python3-dbg
                    libluksde-dbg
                    libluksde-python3-dbg
                    libmodi-dbg
                    libmodi-python3-dbg
                    libmsiecf-dbg
                    libmsiecf-python3-dbg
                    libolecf-dbg
                    libolecf-python3-dbg
                    libphdi-dbg
                    libphdi-python3-dbg
                    libqcow-dbg
                    libqcow-python3-dbg
                    libregf-dbg
                    libregf-python3-dbg
                    libscca-dbg
                    libscca-python3-dbg
                    libsigscan-dbg
                    libsigscan-python3-dbg
                    libsmdev-dbg
                    libsmdev-python3-dbg
                    libsmraw-dbg
                    libsmraw-python3-dbg
                    libvhdi-dbg
                    libvhdi-python3-dbg
                    libvmdk-dbg
                    libvmdk-python3-dbg
                    libvsgpt-dbg
                    libvsgpt-python3-dbg
                    libvshadow-dbg
                    libvshadow-python3-dbg
                    libvslvm-dbg
                    libvslvm-python3-dbg";

sudo add-apt-repository ppa:gift/${GIFT_PPA_TRACK} -y
sudo apt-get update -q
sudo apt-get install -q -y ${PYTHON_DEPENDENCIES}

if [[ "$*" =~ "include-debug" ]];
then
	sudo apt-get install -q -y ${DEBUG_DEPENDENCIES}
fi

if [[ "$*" =~ "include-development" ]];
then
	sudo apt-get install -q -y ${DEVELOPMENT_DEPENDENCIES}
fi

if [[ "$*" =~ "include-test" ]];
then
	sudo apt-get install -q -y ${TEST_DEPENDENCIES}
fi
