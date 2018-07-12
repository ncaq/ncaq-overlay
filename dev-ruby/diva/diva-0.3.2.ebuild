# Public Domain

EAPI=6

USE_RUBY="ruby22 ruby23 ruby24 ruby25"

inherit ruby-fakegem

DESCRIPTION="Implementation of expression for handling things."
HOMEPAGE="https://rubygems.org/gems/diva"

IUSE=""
KEYWORDS="~amd64 ~x86"
LICENSE="MIT"
SLOT="0"

ruby_add_rdepend ">=dev-ruby/addressable-2.5.2"
