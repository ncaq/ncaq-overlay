# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7} )

inherit distutils-r1

DESCRIPTION="A simple wrapper around inotify. No fancy bells and whistles, just a literal wrapper with ctypes. Only 127 lines of code!"
HOMEPAGE="https://pypi.org/project/inotify_simple/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="BSD"
SLOT="0"
