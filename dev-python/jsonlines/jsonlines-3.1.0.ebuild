# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_8,3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="Library with helpers for the jsonlines file format"
HOMEPAGE="https://pypi.org/project/jsonlines/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="BSD"
SLOT="0"

BDEPEND="
dev-python/six
"

RDEPEND="$BDEPEND"
