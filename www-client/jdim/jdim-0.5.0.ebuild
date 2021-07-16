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

RDEPEND="
dev-cpp/gtkmm:3.0
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
