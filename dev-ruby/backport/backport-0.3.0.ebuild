# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_BINDIR=""

inherit ruby-fakegem

DESCRIPTION="A pure Ruby library for event-driven IO"
HOMEPAGE="https://rubygems.org/gems/backport"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
