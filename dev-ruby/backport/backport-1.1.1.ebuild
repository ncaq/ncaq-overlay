# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for event-driven IO"
HOMEPAGE="https://rubygems.org/gems/backport"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
=dev-ruby/rspec-3*
dev-ruby/simplecov
"
