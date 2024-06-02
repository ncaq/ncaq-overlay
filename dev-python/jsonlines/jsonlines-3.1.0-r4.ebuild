# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Library with helpers for the jsonlines file format"
HOMEPAGE="https://pypi.org/project/${PN}/"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

LICENSE="BSD"
SLOT="0"

DEPEND="
dev-python/attrs[${PYTHON_USEDEP}]
dev-python/six[${PYTHON_USEDEP}]
"

RDEPEND="$DEPEND"
