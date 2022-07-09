# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9,3_10,3_11} )

inherit distutils-r1

DESCRIPTION="Python wrapper for the Cloudflare v4 API"
HOMEPAGE="https://pypi.org/project/cloudflare/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="MIT"
SLOT="0"

BDEPEND="
dev-python/beautifulsoup4
dev-python/future
dev-python/jsonlines
dev-python/pyyaml
dev-python/requests
"

RDEPEND="$BDEPEND"

python_prepare_all() {
  sed -e "s/packages=\['cli4', 'examples'\]+find_packages(),/packages=find_packages(),/" -i setup.py
  sed -e "s:data_files = \[('man/man1', \['cli4/cli4.man'\])\],::" -i setup.py
  rm -r cli4 examples
  distutils-r1_python_prepare_all
}
