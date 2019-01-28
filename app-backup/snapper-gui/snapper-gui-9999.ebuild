# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

DESCRIPTION="GUI for snapper, a tool for Linux filesystem snapshot management, works with btrfs, ext4 and thin-provisioned LVM volumes"
HOMEPAGE="https://github.com/ricardomv/snapper-gui"
LICENSE="GPL-2"

EGIT_REPO_URI="https://github.com/ricardomv/snapper-gui.git"

PYTHON_COMPAT=( python{3_6,3_7} )

inherit distutils-r1
inherit git-r3

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
app-backup/snapper
dev-lang/python
dev-python/dbus-python
dev-python/pygobject
dev-python/setuptools
x11-libs/gtk+:3
x11-libs/gtksourceview:3.0
"

DEPEND="
${RDEPEND}
"
