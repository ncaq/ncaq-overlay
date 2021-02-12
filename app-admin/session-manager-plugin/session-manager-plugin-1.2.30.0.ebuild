# Copyright 2021 ncaq
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit rpm

DESCRIPTION="Manages shell experience using SSM APIs"
HOMEPAGE="https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html"
SRC_URI="https://s3.amazonaws.com/session-manager-downloads/plugin/${PV}/linux_64bit/session-manager-plugin.rpm -> session-manager-plugin-${PV}.rpm"
KEYWORDS="~amd64"
LICENSE="Apache-2.0"
SLOT="0"

RDEPEND="
app-shells/bash
sys-libs/glibc
"

DEPEND="
${RDEPEND}
"

src_unpack() {
	mkdir ${S}
	cd ${S}
	rpm_unpack ${A}
}

src_install() {
	exeinto /usr/bin
	doexe usr/local/sessionmanagerplugin/bin/*
}
