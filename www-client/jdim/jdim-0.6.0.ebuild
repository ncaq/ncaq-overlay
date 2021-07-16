# Copyright 2020 ncaq
# Distributed under the terms of the GNU General Public License v2 or later

EAPI=7

inherit autotools

DESCRIPTION="2ch browser for linux"
HOMEPAGE="https://github.com/JDimproved/JDim"
KEYWORDS="~amd64"
LICENSE="GPL-2"
SLOT="0"
SRC_URI="https://github.com/JDimproved/JDim/archive/JDim-v${PV}.tar.gz"
S="${WORKDIR}/JDim-JDim-v${PV}"

# 厳密にはPerlのツールが必要なわけでは無いのですが、2chProxy無しにJDim使う人は居ないという想定をしています。
RDEPEND="
dev-cpp/gtkmm:3.0
dev-lang/perl[ithreads]
dev-perl/HTTP-Daemon
net-libs/gnutls
sys-devel/autoconf-archive
sys-devel/automake
sys-devel/libtool
x11-libs/libSM
"

src_prepare() {
	default
	eautoreconf
}

src_configure() {
	econf
}
