# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23"

inherit ruby-fakegem

DESCRIPTION="Standards-compliant WebSocket server and client"
HOMEPAGE="https://rubygems.org/gems/faye-websocket/versions/0.10.4"
KEYWORDS="~amd64 ~x86"
SLOT="0"

ruby_add_rdepend "
>=dev-ruby/eventmachine-0.12.0
>=dev-ruby/websocket-driver-0.5.1
"
