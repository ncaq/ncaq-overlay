# Copyright 2022 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="The granddaddy of HTML tools, with support for modern standards"
HOMEPAGE="https://www.html-tidy.org/"

MY_PN="tidy-html5"
EGIT_REPO_URI="https://github.com/htacg/${MY_PN}.git"

LICENSE="BSD"
SLOT="0/9999" # subslot is SOVERSION
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86 ~amd64-linux ~x86-linux ~ppc-macos ~x64-macos"
