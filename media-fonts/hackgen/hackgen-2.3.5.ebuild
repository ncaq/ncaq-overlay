# Copyright 2021 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="HackGen is Japanese programming font which is a composed of Hack and GenJyuu-Gothic."
HOMEPAGE="https://github.com/yuru7/HackGen"

SRC_URI="
https://github.com/yuru7/HackGen/releases/download/v2.3.5/HackGen_v${PV}.zip
https://github.com/yuru7/HackGen/releases/download/v2.3.5/HackGenNerd_v${PV}.zip
"

LICENSE="OFL-1.1"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"

src_unpack() {
	mkdir $S
	cd $S
	default_src_unpack
}

src_install() {
	insinto /usr/share/fonts/$PN
	doins HackGen*/*.ttf
}
