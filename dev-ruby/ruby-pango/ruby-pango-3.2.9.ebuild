# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit ruby-ng-gnome2

DESCRIPTION="Ruby Pango bindings"
DEPEND+=">=x11-libs/pango-1.2.1"
RDEPEND+=">=x11-libs/pango-1.2.1"

ruby_add_rdepend "
>=dev-ruby/rcairo-1.14.0
>=dev-ruby/ruby-cairo-gobject-${PV}
>=dev-ruby/ruby-glib2-${PV}
>=dev-ruby/ruby-gobject-introspection-${PV}
"
ruby_add_bdepend ">=dev-ruby/rcairo-1.14.0"

all_ruby_prepare() {
	# Remove test depending on specific locales to be set up: bug 526248
	rm -f test/test-language.rb || die

	# Avoid compilation of dependencies during test.
	sed -i -e '/system/,/^  end/ s:^:#:' test/run-test.rb || die

	# Remove native-package-installer
	sed -i -e 's/.*native-package-installer.*//' ../glib2/lib/mkmf-gnome2.rb || die
	sed -i -e 's/.*setup_homebrew_libffi if target_name == "gobject-introspection"//' ../glib2/lib/mkmf-gnome2.rb || die
	sed -i -e 's/    setup_homebrew_libffi//' ../glib2/lib/mkmf-gnome2.rb || die
}

each_ruby_test() {
	${RUBY} test/run-test.rb || die
}
