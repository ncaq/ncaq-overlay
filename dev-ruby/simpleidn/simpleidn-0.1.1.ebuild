# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby24 ruby25 ruby26"

inherit ruby-fakegem

DESCRIPTION="This gem allows easy conversion from punycode ACE strings to unicode UTF-8 strings and vice-versa."
HOMEPAGE="https://rubygems.org/gems/simpleidn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

ruby_add_rdepend "
dev-ruby/unf
"
