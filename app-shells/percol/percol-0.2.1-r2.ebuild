# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..12} )

inherit distutils-r1 pypi

DESCRIPTION="Adds flavor of interactive filtering to the traditional pipe concept of shell"
HOMEPAGE="https://pypi.org/project/${PN}/"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

LICENSE="MIT"
SLOT="0"

RDEPEND="
>=dev-python/six-1.7.3[${PYTHON_USEDEP}]
"
