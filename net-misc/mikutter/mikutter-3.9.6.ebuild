# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# This script based on net-misc/mikutter:gentoo

# original Copyright

# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-ng

DESCRIPTION="simple, powerful and moeful twitter client"
HOMEPAGE="https://mikutter.hachune.net/"
KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
SRC_URI="https://mikutter.hachune.net/bin/${PN}.${PV}.tar.gz"

RDEPEND="
dev-libs/openssl
x11-libs/libnotify
"

rdepend_root="
=dev-ruby/addressable-2.6*
=dev-ruby/delayer-1.0*
=dev-ruby/delayer-deferred-2.1*
=dev-ruby/diva-1.0*
=dev-ruby/memoist-0.16*
>=dev-ruby/oauth-0.5.4
=dev-ruby/pluggaloid-1.2*
=dev-ruby/typed-array-0.1*
"

rdepend_gtk="
=dev-ruby/ruby-gtk2-3.3.7*
"

rdepend_image_file_cache="
dev-ruby/moneta
"

rdepend_photo_support="
dev-ruby/nokogiri
dev-ruby/httpclient
"

rdepend_twitter="
dev-ruby/twitter-text-simpleidn
"

rdepend_uitranslator="
=dev-ruby/ruby-gettext-3.2*
"

ruby_add_rdepend "
${rdepend_root}
${rdepend_gtk}
${rdepend_image_file_cache}
${rdepend_photo_support}
${rdepend_twitter}
${rdepend_uitranslator}
"

PATCHES=( "${FILESDIR}/consumer-override.patch" )

each_ruby_install() {
	exeinto /usr/share/mikutter
	insinto /usr/share/mikutter
	doins -r mikutter/core
	doins -r mikutter/data
	doins mikutter/*
	newbin "${FILESDIR}"/mikutter mikutter
	dodoc mikutter/README
	# make_desktop_entry mikutter Mikutter /usr/share/mikutter/core/skin/data/icon.png
}
