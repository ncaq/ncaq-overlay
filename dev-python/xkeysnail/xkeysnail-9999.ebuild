# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8} )

inherit distutils-r1
inherit git-r3

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/mooz/xkeysnail https://pypi.org/project/xkeysnail/"
EGIT_REPO_URI="https://github.com/mooz/xkeysnail.git"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="GPL"
SLOT="0"

RDEPEND="
dev-python/inotify_simple
dev-python/python-evdev
dev-python/python-xlib
"
