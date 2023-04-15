# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python{3_10,3_11} )

inherit distutils-r1

DESCRIPTION="Adds flavor of interactive filtering to the traditional pipe concept of shell"
HOMEPAGE="https://github.com/mooz/percol"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

LICENSE="MIT"
SLOT="0"

RDEPEND="
dev-lang/python
>=dev-python/six-1.7.3[${PYTHON_USEDEP}]
"
