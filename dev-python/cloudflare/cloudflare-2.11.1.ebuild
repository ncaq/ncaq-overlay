# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{8..11} )

inherit distutils-r1

DESCRIPTION="Python wrapper for the Cloudflare v4 API"
HOMEPAGE="https://pypi.org/project/${PN}/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

LICENSE="MIT"
SLOT="0"

BDEPEND="
dev-python/beautifulsoup4[${PYTHON_USEDEP}]
dev-python/future[${PYTHON_USEDEP}]
dev-python/jsonlines[${PYTHON_USEDEP}]
dev-python/pyyaml[${PYTHON_USEDEP}]
dev-python/requests[${PYTHON_USEDEP}]
"

RDEPEND="$BDEPEND"

python_prepare_all() {
	sed -e "s/packages=\['cli4', 'examples'\]+find_packages(),/packages=\['cli4'\]+find_packages(),/" -i setup.py
	rm -r examples
	distutils-r1_python_prepare_all
}
