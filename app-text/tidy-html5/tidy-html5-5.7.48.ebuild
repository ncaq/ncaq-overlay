# Copyright 2021 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake git-r3

DESCRIPTION="Tidy the layout and correct errors in HTML, HTML5 and XML documents"
HOMEPAGE="https://www.html-tidy.org/"
EGIT_REPO_URI="https://github.com/htacg/tidy-html5.git"
EGIT_COMMIT="fa6d5b545db3039ed617ba7dcc9bc61193dc3559"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~s390 ~sparc ~x86"

RDEPEND="!app-text/htmltidy"

DOCS=( README/{CODESTYLE,CONTRIBUTING,LICENSE,VERSION}.md )

src_configure() {
	local mycmakeargs=(
		-DLIB_INSTALL_DIR="$(get_libdir)"
	)
	cmake_src_configure
}
