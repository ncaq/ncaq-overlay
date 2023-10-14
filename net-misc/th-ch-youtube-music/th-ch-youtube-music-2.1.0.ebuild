# Copyright 2023 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# このソフトウェアはMITライセンスで提供されており、ソースコードも公開されています。
# なので、本来はソースコードからのビルドが可能です。
# ただし、このソフトウェアはElectronベースのアプリケーションであり、アプリケーションロジックはTypeScriptとJavaScriptで実装されています。
# C++などのネイティブコードは含まれていないため、個別のマシン向けのビルド時最適化は期待できません。
# Electronのコア部分に対して最適化を施す可能性は理論的には存在しますが、
# オフィシャルのドキュメントやガイドラインでそのような自前ビルドが推奨されているわけではないため、
# そのような最適化を行うことは労力がかかり、その効果も限定的と考えられます。
# さらに、Gentooの公式パッケージでもこのようなビルド最適化は行われていないようです。
# 以上の理由から、rpmパッケージからの変換を用いています。
inherit rpm desktop

DESCRIPTION="YouTube Music Desktop App bundled with custom plugins (and built-in ad blocker / downloader)"
HOMEPAGE="https://th-ch.github.io/youtube-music/"
SRC_URI="https://github.com/th-ch/youtube-music/releases/download/v${PV}/youtube-music-${PV}.x86_64.rpm"
KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"

RDEPEND="
app-accessibility/at-spi2-core
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
