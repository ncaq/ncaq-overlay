# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )

inherit distutils-r1 pypi

DESCRIPTION="Yet another keyboard remapping tool for X environment."
HOMEPAGE="https://github.com/mooz/xkeysnail https://pypi.org/project/${PN}/"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

LICENSE="GPL-3+"
SLOT="0"

RDEPEND="
dev-lang/python[tk]
dev-python/appdirs[${PYTHON_USEDEP}]
dev-python/evdev[${PYTHON_USEDEP}]
dev-python/inotify_simple[${PYTHON_USEDEP}]
dev-python/python-xlib[${PYTHON_USEDEP}]
"
