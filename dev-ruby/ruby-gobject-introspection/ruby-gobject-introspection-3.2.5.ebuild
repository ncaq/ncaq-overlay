# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24 ruby25"

inherit ruby-ng-gnome2

RUBY_S=ruby-gnome2-all-${PV}/gobject-introspection

DESCRIPTION="Ruby GObjectIntrospection bindings"
KEYWORDS="~amd64 ~ppc ~x86"

DEPEND+="dev-libs/gobject-introspection"
RDEPEND+="dev-libs/gobject-introspection"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"

all_ruby_prepare() {
	# Remove pregenerated Makefile since it will otherwise be shared by all targets.
	rm -f Makefile Makefile.lib ext/gobject-introspection/Makefile || die

	# Avoid unneeded dependency on test-unit-notify.
	sed -i -e '/notify/ s:^:#:' test/gobject-introspection-test-utils.rb || die

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
