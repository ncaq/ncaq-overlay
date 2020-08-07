# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/mooz/xkeysnail https://pypi.org/project/xkeysnail/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="GPL"
SLOT="0"

RDEPEND="
dev-python/inotify_simple
dev-python/python-evdev
dev-python/python-xlib
<=dev-libs/libinput-1.15.6
"
