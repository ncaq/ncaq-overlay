# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Original Copyright

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_RECIPE_TEST="rspec"

RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_EXTRAINSTALL="config"
RUBY_FAKEGEM_RECIPE_DOC="rdoc"

inherit ruby-fakegem

DESCRIPTION="A gem that provides text handling for Twitter"
HOMEPAGE="https://rubygems.org/gems/twitter-text/"

LICENSE="Apache"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
=dev-ruby/unf-0.1*
dev-ruby/idn-ruby
"

ruby_add_bdepend "test? ( >=dev-ruby/multi_json-1.3
	>=dev-ruby/nokogiri-1.5.10 )"

all_ruby_prepare() {
	sed -i -e 's/2.14.0/2.14/' twitter-text.gemspec || die
	sed -i -e '/simplecov/,/end/ s:^:#:' spec/spec_helper.rb || die
}
