# Copyright 2018 ncaq
# Distributed under the terms of the GNU General Public License v2

# Original Copyright

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
USE_RUBY="ruby21 ruby22 ruby23 ruby24 ruby25"

RUBY_FAKEGEM_NAME="atk"

inherit ruby-fakegem

DESCRIPTION="Ruby/ATK is a Ruby binding of ATK-1.0.x."
HOMEPAGE="https://rubygems.org/gems/atk/versions/3.0.7"

DEPEND+="dev-libs/atk"
RDEPEND+="dev-libs/atk"

KEYWORDS="~amd64"
LICENSE="LGPL-2.1"
SLOT="0"

ruby_add_rdepend ">=dev-ruby/ruby-glib2-${PV}"
