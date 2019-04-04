# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

PYTHON_COMPAT=( python{2_7,3_{4,5,6,7}} )
PYTHON_REQ_USE="ncurses"

inherit distutils-r1 eutils linux-info

DESCRIPTION="CLI curses based monitoring tool"
HOMEPAGE="https://github.com/nicolargo/glances"
SRC_URI="https://github.com/nicolargo/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86 ~amd64-linux ~x86-linux"
IUSE="action cloud doc docker folder ip quicklook raid snmp svg test web wifi zeroconf"

RDEPEND="
>=dev-python/psutil-5.4.3[${PYTHON_USEDEP}]
action? ( dev-python/pystache[${PYTHON_USEDEP}] )
cloud? ( dev-python/requests[${PYTHON_USEDEP}] )
docker? ( dev-python/docker-py[${PYTHON_USEDEP}] )
folder? ( dev-python/scandir[${PYTHON_USEDEP}] )
ip? ( dev-python/netifaces[${PYTHON_USEDEP}] )
quicklook? ( dev-python/py-cpuinfo[${PYTHON_USEDEP}] )
raid? ( dev-python/pymdstat[${PYTHON_USEDEP}] )
snmp? ( dev-python/pysnmp[${PYTHON_USEDEP}] )
svg? ( dev-python/pygal[${PYTHON_USEDEP}] )
web? ( dev-python/bottle[${PYTHON_USEDEP}] dev-python/requests[${PYTHON_USEDEP}] )
wifi? ( net-wireless/python-wifi[${PYTHON_USEDEP}] )
zeroconf? ( dev-python/zeroconf[${PYTHON_USEDEP}] )
"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	doc? (
		dev-python/sphinx[${PYTHON_USEDEP}]
		dev-python/sphinx_rtd_theme[${PYTHON_USEDEP}]
	)
	test? ( ${RDEPEND} )
"

CONFIG_CHECK="~TASK_IO_ACCOUNTING ~TASK_DELAY_ACCT ~TASKSTATS"

pkg_setup() {
	linux-info_pkg_setup
}

python_prepare_all() {
	# Remove duplicate entries of a prebuilt doc build and
	# ensure install of the file glances.conf in /etc/${PN}
	sed \
		-e '/share\/doc\/glances/d' \
		-e "s/'CONTRIBUTING.md',//" \
		-e "s:'conf/glances.conf':('${EPREFIX}/etc/glances', ['conf/glances.conf':g" \
		-i setup.py || die

	distutils-r1_python_prepare_all
}

python_install_all() {
	# add an intended file from original data set from setup.py to DOCS
	local DOCS=( README.rst CONTRIBUTING.md conf/glances.conf )
	# build docs
	if use doc; then
		pushd docs
		make html
		popd
		local HTML_DOCS=( docs/_build/html/. )
	fi
	distutils-r1_python_install_all
}

python_test() {
	esetup.py test
}
