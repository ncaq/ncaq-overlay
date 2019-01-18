# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="Map simple html back into markdown, e.g. if you want to import existing html data in your application."
HOMEPAGE="https://rubygems.org/gems/reverse_markdown"

LICENSE="N/A"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
>=dev-ruby/nokogiri-1.8.1
"
