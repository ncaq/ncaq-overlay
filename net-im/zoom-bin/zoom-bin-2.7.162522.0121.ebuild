# Copyright 2019 ncaq
# Distributed under the terms of the GNU General Public License v2

# fork from [calculate/zoom-2.6.146750.1204-r1.ebuild at 5c0afc38cd760037b1ae7e8fde493298f2d23e6c · gentoo-mirror/calculate](https://github.com/gentoo-mirror/calculate/blob/5c0afc38cd760037b1ae7e8fde493298f2d23e6c/net-im/zoom/zoom-2.6.146750.1204-r1.ebuild)

# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit unpacker gnome2-utils xdg

MY_PN=${PN/-bin/}

DESCRIPTION="Video conferencing and web conferencing service"
HOMEPAGE="https://zoom.us"
SRC_URI="amd64? ( https://zoom.us/client/${PV}/${MY_PN}_x86_64.pkg.tar.xz -> ${PN}-${PV}_x86_64.pkg.tar.xz  )"

LICENSE="ZOOM"
SLOT="0"
KEYWORDS="amd64"

IUSE="pulseaudio"

QA_PREBUILT="opt/zoom/*"

RDEPEND="
pulseaudio? ( media-sound/pulseaudio )
dev-db/sqlite
dev-db/unixODBC
dev-libs/glib
dev-libs/libxslt
dev-libs/nss
dev-qt/qt3d
dev-qt/qtconcurrent
dev-qt/qtdeclarative
dev-qt/qtmultimedia
dev-qt/qtquickcontrols2
dev-qt/qtsql
dev-qt/qtsvg
dev-qt/qtxmlpatterns
media-libs/fontconfig
media-libs/gst-plugins-base
media-libs/gstreamer
media-libs/mesa
x11-libs/libXcomposite
x11-libs/libXi
x11-libs/libXrender
x11-libs/libxcb
"

S=${WORKDIR}

src_prepare() {
	rm -rf ${WORKDIR}/.PKGINFO ${WORKDIR}/.INSTALL ${WORKDIR}/.MTREE ${WORKDIR}/usr/share/doc
	sed -i -e 's:Icon=Zoom.png:Icon=Zoom:' "${WORKDIR}/usr/share/applications/Zoom.desktop"
	sed -i -e 's:Application;::' "${WORKDIR}/usr/share/applications/Zoom.desktop"
	eapply_user
}

src_install() {
	insinto /
	doins -r *
	fperms a+x /opt/zoom/{zoom,ZoomLauncher,zoom.sh,zopen,zoomlinux}
}

pkg_preinst() {
	xdg_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}

pkg_postrm() {
	xdg_desktop_database_update
	xdg_mimeinfo_database_update
	gnome2_icon_cache_update
}
