# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby23 ruby24 ruby25 ruby26"

RUBY_FAKEGEM_EXTRAINSTALL="ext"

inherit ruby-fakegem

DESCRIPTION="jaro_winkler is an implementation of Jaro-Winkler \ distance algorithm which is written in C extension and will fallback to pure \ Ruby version in platforms other than MRI/KRI like JRuby or Rubinius. Both of \ C and Ruby implementation support any kind of string encoding, such as \ UTF-8, EUC-JP, Big5, etc."
HOMEPAGE="https://rubygems.org/gems/jaro_winkler"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

each_ruby_configure() {
	${RUBY} -Cext/jaro_winkler extconf.rb || die
}

each_ruby_compile() {
	emake -Cext/jaro_winkler V=1 || die
	cp ext/jaro_winkler/* lib/jaro_winkler || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb tests/* || die
}
