# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRAINSTALL="yardoc"

inherit ruby-fakegem

DESCRIPTION="IDE tools for code analysis and autocompletion"
HOMEPAGE="https://rubygems.org/gems/solargraph/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
=dev-ruby/rubocop-0.52*
>=dev-ruby/backport-0.3
>=dev-ruby/htmlentities-4.3.4
>=dev-ruby/jaro_winkler-1.5
>=dev-ruby/kramdown-1.16
>=dev-ruby/parser-2.3
>=dev-ruby/reverse_markdown-1.0.5
>=dev-ruby/thor-0.19
>=dev-ruby/tilt-2.0
>=dev-ruby/yard-0.9
"
