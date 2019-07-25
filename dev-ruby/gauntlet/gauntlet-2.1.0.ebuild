# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="Gauntlet is a pluggable means of running code against all the latest gems and storing off the data."
HOMEPAGE="https://rubygems.org/gems/gauntlet"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
dev-ruby/net-http-persistent
dev-ruby/hoe
dev-ruby/minitest
dev-ruby/rdoc
"
