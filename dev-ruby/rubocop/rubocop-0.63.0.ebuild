# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRAINSTALL="assets config"

inherit ruby-fakegem

DESCRIPTION="Automatic Ruby code style checking tool. Aims to enforce the community-driven Ruby Style Guide."
HOMEPAGE="https://rubygems.org/gems/rubocop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
>=dev-ruby/jaro_winkler-1.5
>=dev-ruby/parallel-1.10
>=dev-ruby/parser-2.5
>=dev-ruby/powerpack-0.1
>=dev-ruby/rainbow-2.2.2
>=dev-ruby/unicode-display_width-1.4.0
"
