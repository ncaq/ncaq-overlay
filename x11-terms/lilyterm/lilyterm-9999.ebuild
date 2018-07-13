# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

DESCRIPTION="a terminal emulator based off of libvte that aims to be fast and lightweight"
HOMEPAGE="https://lilyterm.luna.com.tw"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/Tetralet/LilyTerm.git"
inherit git-r3

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
x11-libs/vte:0
"
DEPEND="
${RDEPEND}
dev-libs/glib
dev-util/intltool
sys-devel/gettext
virtual/pkgconfig
x11-libs/gtk+:2
"

DOCS=( AUTHORS ChangeLog README TODO )
