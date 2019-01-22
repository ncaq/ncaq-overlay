# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# This script based on net-misc/mikutter:gentoo

# original Copyright

# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby24"

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

ruby_add_rdepend "
<=dev-ruby/addressable-2.6
>=dev-ruby/addressable-2.3
>=dev-ruby/delayer-0.0
>=dev-ruby/delayer-deferred-2.0
>=dev-ruby/diva-0.3.1
>=dev-ruby/json_pure-1.8
>=dev-ruby/memoist-0.16
>=dev-ruby/oauth-0.5.1
>=dev-ruby/pluggaloid-1.1.1
>=dev-ruby/ruby-gettext-3.0.1
>=dev-ruby/ruby-gtk2-3.2.9
>=dev-ruby/ruby-hmac-0.4
>=dev-ruby/ruby-pango-3.1.3
>=dev-ruby/twitter-text-2.1.0
>=dev-ruby/typed-array-0.1
dev-ruby/httpclient
dev-ruby/moneta
dev-ruby/nokogiri
dev-ruby/totoridipjp
"

PATCHES=( "${FILESDIR}/consumer-override.patch" )

each_ruby_install() {
	exeinto /usr/share/mikutter
	insinto /usr/share/mikutter
	doins -r mikutter/core
	doins -r mikutter/data
	doins mikutter/*
	sed -e 's/\/usr\/bin\/ruby/\/usr\/bin\/ruby24/' "${FILESDIR}"/mikutter |
		newbin - mikutter
	dodoc mikutter/README
	make_desktop_entry mikutter Mikutter /usr/share/mikutter/core/skin/data/icon.png
}
