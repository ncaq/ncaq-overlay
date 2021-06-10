# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

# from [net-misc/grive – Gentoo Packages](https://packages.gentoo.org/packages/net-misc/grive)
# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils systemd

if [[ ${PV} = *9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/vitalif/${PN}2.git"
else
	inherit vcs-snapshot
	COMMIT="3c90425b8f46b62365ec3d84de628163865dbb1e"
	SRC_URI="https://github.com/vitalif/${PN}2/archive/${COMMIT}.tar.gz -> ${P}.tar.gz"
fi

DESCRIPTION="An open source Linux client for Google Drive"
HOMEPAGE="https://github.com/vitalif/grive2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 -x86-fbsd ~amd64-linux ~x86-linux ~m68k-mint"
IUSE="zsh-completion"

RDEPEND="
dev-libs/boost
dev-libs/expat
dev-libs/json-c
dev-libs/libgcrypt
dev-libs/yajl
sys-libs/binutils-libs
sys-libs/glibc
|| ( net-misc/curl[curl_ssl_openssl] net-misc/curl[curl_ssl_gnutls] )
systemd? ( sys-fs/inotify-tools sys-apps/systemd )
"
DEPEND="${RDEPEND}"

src_install() {
	cmake-utils_src_install
	if use zsh-completion ; then
		insinto /usr/share/zsh/site-functions
		newins completion.zsh _grive
	fi
}
