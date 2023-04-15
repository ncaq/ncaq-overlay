# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python{3_10,3_11} )

inherit distutils-r1

DESCRIPTION="API client to develop tools for competitive programming"
HOMEPAGE="https://github.com/online-judge-tools/api-client"
SRC_URI="https://github.com/online-judge-tools/api-client/archive/refs/tags/v${PV}.tar.gz"
KEYWORDS="~amd64 ~x86 ~arm64 ~arm"

LICENSE="MIT"
SLOT="0"

S="${WORKDIR}/api-client-${PV}"

RDEPEND="
dev-lang/python
>=dev-python/appdirs-1[${PYTHON_USEDEP}]
>=dev-python/beautifulsoup4-4[${PYTHON_USEDEP}]
>=dev-python/colorlog-4.1.0[${PYTHON_USEDEP}]
>=dev-python/jsonschema-3.2[${PYTHON_USEDEP}]
>=dev-python/lxml-4[${PYTHON_USEDEP}]
>=dev-python/requests-2[${PYTHON_USEDEP}]
>=dev-python/toml-0.10[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
