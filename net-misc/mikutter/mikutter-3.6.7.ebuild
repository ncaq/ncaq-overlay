# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# This script based on net-misc/mikutter:gentoo

# original Copyright

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby23 ruby24"

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
>=dev-ruby/addressable-2.3
>=dev-ruby/delayer-0.0
>=dev-ruby/delayer-deferred-2.0
>=dev-ruby/diva-0.3.1
>=dev-ruby/json-1.8
>=dev-ruby/memoist-0.16
>=dev-ruby/oauth-0.5.1
>=dev-ruby/pluggaloid-1.1.1
>=dev-ruby/ruby-gettext-3.0.1
>=dev-ruby/ruby-gtk2-3.2.1
>=dev-ruby/ruby-hmac-0.4
>=dev-ruby/ruby-pango-3.1.3
>=dev-ruby/twitter-text-2.1.0
>=dev-ruby/typed-array-0.1
dev-ruby/httpclient
dev-ruby/moneta
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
