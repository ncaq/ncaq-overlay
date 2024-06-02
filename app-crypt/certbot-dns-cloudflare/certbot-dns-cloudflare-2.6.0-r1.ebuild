# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Cloudflare DNS Authenticator plugin for Certbot"
HOMEPAGE="https://pypi.org/project/${PN}/"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND="
>=app-crypt/acme-${PV}[${PYTHON_USEDEP}]
>=app-crypt/certbot-${PV}[${PYTHON_USEDEP}]
>=dev-python/cloudflare-1.5.1[${PYTHON_USEDEP}]
"

RDEPEND="$BDEPEND"
