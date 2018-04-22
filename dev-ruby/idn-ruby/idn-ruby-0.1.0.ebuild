# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_EXTRADOC="CHANGES README"
RUBY_FAKEGEM_TASK_DOC=""

inherit multilib ruby-fakegem

DESCRIPTION="Ruby Bindings for the GNU LibIDN library"
HOMEPAGE="https://rubygems.org/gems/idn-ruby"
KEYWORDS="~amd64 ~x86"
RDEPEND="net-dns/libidn"

SLOT="0"

each_ruby_configure() {
	${RUBY} -Cext extconf.rb || die
}

each_ruby_compile() {
	emake -Cext V=1 || die
	mkdir lib
	cp ext/idn$(get_modname) lib/ || die
}

each_ruby_test() {
	${RUBY} -Ilib -S testrb tests/* || die
}
