# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python{3_6,3_7,3_8,3_9} )

inherit distutils-r1

DESCRIPTION="Cloudflare DNS Authenticator plugin for Certbot"
HOMEPAGE="https://pypi.org/project/certbot-dns-cloudflare/"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
KEYWORDS="~amd64 ~arm64 ~x86"

LICENSE="Apache-2.0"
SLOT="0"

BDEPEND="
app-crypt/acme
app-crypt/certbot
dev-python/cloudflare
dev-python/zope-interface
"

RDEPEND="$BDEPEND"
