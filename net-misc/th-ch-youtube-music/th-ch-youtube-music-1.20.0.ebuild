# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# 自分でビルドできるソフトウェアなのにrpmからの変換に甘えています。
# しかしこれはJavaScriptで書かれたElectronアプリです。
# つまりアプリケーション側にはネイティブコードが存在しません。
# なのでどうせビルド時CPU最適化を容易にはかけられないはずなので、
# rpmからの変換でサボっています。
# 一応Electron側をChromium部分からビルドするという荒業は存在するかもしれませんが。
inherit rpm desktop

DESCRIPTION="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
HOMEPAGE="https://th-ch.github.io/youtube-music/"
SRC_URI="https://github.com/th-ch/youtube-music/releases/download/v${PV}/youtube-music-${PV}.x86_64.rpm"
KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

RDEPEND="
app-crypt/libsecret
dev-libs/nss
x11-libs/gtk+:3
x11-libs/libXtst
x11-libs/libnotify
x11-misc/xdg-utils
"

DEPEND="
${RDEPEND}
"

DESTDIR="/opt/${PN}"

src_unpack() {
	mkdir ${S}
	cd ${S}
	rpm_unpack ${A}
}

src_install() {
	insopts -m0755
	doins -r opt usr
	dosym '/opt/YouTube Music/youtube-music' usr/bin/youtube-music

	doicon -s 1024 usr/share/icons/hicolor/1024x1024/apps/youtube-music.png
	domenu usr/share/applications/youtube-music.desktop
}
