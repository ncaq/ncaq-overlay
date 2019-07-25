# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="A Ruby parser written in pure Ruby."
HOMEPAGE="https://rubygems.org/gems/parser/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
dev-ruby/ast
dev-ruby/bundler
dev-ruby/cliver
dev-ruby/gauntlet
dev-ruby/kramdown
dev-ruby/minitest
dev-ruby/racc
dev-ruby/rake
dev-ruby/simplecov
dev-ruby/yard
"
