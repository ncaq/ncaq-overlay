# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

inherit virtualx ruby-ng-gnome2

DESCRIPTION="Ruby Gtk2 bindings"

DEPEND+="x11-libs/gtk+:2 x11-themes/hicolor-icon-theme"
RDEPEND+="x11-libs/gtk+:2"

ruby_add_bdepend "
>=dev-ruby/ruby-glib2-${PV}
>=dev-ruby/ruby-pango-${PV}
"
ruby_add_rdepend "
>=dev-ruby/ruby-atk-${PV}
>=dev-ruby/ruby-gdkpixbuf2-${PV}
>=dev-ruby/ruby-pango-${PV}
"

all_ruby_prepare() {
	# Avoid compilation of dependencies during test.
	sed -i -e '/system/,/^  end/ s:^:#:' test/run-test.rb || die

	# Use standard icon
	sed -i -e 's/"find"/"call-start"/' test/test_gtk_icon_theme.rb || die

	# Remove native-package-installer
	sed -i -e 's/.*native-package-installer.*//' ../glib2/lib/mkmf-gnome2.rb || die
	sed -i -e 's/.*setup_homebrew_libffi if target_name == "gobject-introspection"//' ../glib2/lib/mkmf-gnome2.rb || die
	sed -i -e 's/    setup_homebrew_libffi//' ../glib2/lib/mkmf-gnome2.rb || die
}

each_ruby_test() {
	VIRTUALX_COMMAND=${RUBY}
	virtualmake test/run-test.rb || die
}
