# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="kramdown is yet-another-markdown-parser but fast, pure Ruby, using a strict syntax definition and supporting several common extensions."
HOMEPAGE="https://rubygems.org/gems/kramdown/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
dev-ruby/coderay
dev-ruby/execjs
dev-ruby/itextomml
dev-ruby/minitest
dev-ruby/prawn
dev-ruby/prawn-table
dev-ruby/ritex
dev-ruby/rouge
dev-ruby/stringex
"
