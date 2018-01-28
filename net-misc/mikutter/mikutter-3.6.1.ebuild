# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# This script based on net-misc/mikutter:gentoo

# original Copyright

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23"

inherit ruby-ng

DESCRIPTION="simple, powerful and moeful twitter client"
HOMEPAGE="https://mikutter.hachune.net/"
KEYWORDS="~amd64"
LICENSE="MIT"
SLOT="0"
SRC_URI="http://mikutter.hachune.net/bin/${PN}.${PV}.tar.gz"

RDEPEND="
dev-libs/openssl
x11-libs/libnotify
"

ruby_add_rdepend "
dev-ruby/addressable
dev-ruby/delayer
dev-ruby/delayer-deferred
dev-ruby/diva
dev-ruby/json
dev-ruby/memoist
dev-ruby/oauth
dev-ruby/pluggaloid
dev-ruby/ruby-hmac
dev-ruby/twitter-text
dev-ruby/typed-array

dev-ruby/ruby-gtk2

dev-ruby/moneta

dev-ruby/httpclient
dev-ruby/nokogiri
dev-ruby/totoridipjp
"

each_ruby_install() {
	exeinto /usr/share/mikutter
	doexe mikutter/mikutter.rb
	insinto /usr/share/mikutter
	doins -r mikutter/core
	newbin "${FILESDIR}"/mikutter mikutter
	dodoc mikutter/README
	make_desktop_entry mikutter Mikutter /usr/share/mikutter/core/skin/data/icon.png
}
