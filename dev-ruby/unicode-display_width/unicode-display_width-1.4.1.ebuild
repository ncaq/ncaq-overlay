# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRAINSTALL="data"

inherit ruby-fakegem

DESCRIPTION="[Unicode 11.0.0] Determines the monospace display width of a string using EastAsianWidth.txt, Unicode general category, and other data."
HOMEPAGE="https://rubygems.org/gems/unicode-display_width"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
