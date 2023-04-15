# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python{3_10,3_11} )

inherit distutils-r1

DESCRIPTION="Tools for various online judges. Downloading sample cases, generating additional test cases, testing your code, and submitting it."
HOMEPAGE="https://github.com/online-judge-tools/oj"
SRC_URI="https://github.com/${PN:0:1}/oj/archive/refs/tags/v${PV}.tar.gz"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

LICENSE="MIT"
SLOT="0"

S="${WORKDIR}/oj-${PV}"

RDEPEND="
dev-lang/python
>=app-shells/online-judge-tools-api-client-10.9.0[${PYTHON_USEDEP}]
>=dev-python/colorama-0.3[${PYTHON_USEDEP}]
>=dev-python/requests-2[${PYTHON_USEDEP}]
"
