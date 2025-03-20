# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

# based on
# https://packages.gentoo.org/packages/media-libs/libjpeg-turbo
# https://cgit.gentoo.org/user/haarp.git/tree/media-libs/mozjpeg/mozjpeg-3.2.ebuild

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake

DESCRIPTION="MozJPEG reduces file sizes of JPEG images while retaining quality and compatibility with the vast majority of the world's deployed decoders."
HOMEPAGE="https://github.com/mozilla/mozjpeg"
EGIT_REPO_URI="https://github.com/mozilla/mozjpeg.git"

LICENSE="BSD IJG"

SLOT="0"
KEYWORDS="~amd64 ~x86"

BDEPEND="
dev-build/cmake
|| ( dev-lang/nasm dev-lang/yasm )
"

DEPEND="
media-libs/libpng
sys-libs/zlib
"

src_configure() {
	local mycmakeargs=(
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON
	)
	cmake_src_configure
}

src_install() {
	newbin ${BUILD_DIR}/cjpeg mozcjpeg
	newbin ${BUILD_DIR}/djpeg mozdjpeg
	newbin ${BUILD_DIR}/jpegtran mozjpegtran
	newbin ${BUILD_DIR}/rdjpgcom mozrdjpgcom
	newbin ${BUILD_DIR}/tjbench moztjbench
	newbin ${BUILD_DIR}/wrjpgcom mozwrjpgcom
}
