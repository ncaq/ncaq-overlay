# Public Domain
# $Id$

EAPI=5

MY_PN="Ricty"
MY_PV="$PV"
MY_P="${MY_PN}-${MY_PV}"
S="${WORKDIR}/${MY_P}"

DESCRIPTION="fonts for programming"
HOMEPAGE="https://github.com/yascentur/Ricty"
SRC_URI="https://github.com/yascentur/${MY_PN}/archive/${PV}.tar.gz -> ${MY_PN}-${PV}.tar.gz"

IUSE="
disable-fullwidth-ambiguous-charactors
disable-scaling-down-migu-1m
disable-visible-zenkaku-space
discord
oblique
widen-line-space
widen-line-space-extremely
"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
LICENSE="BSD-2 OFL IPAfont"
SLOT="0"

DEPEND="
>=media-fonts/inconsolata-20140821
>=media-fonts/mix-mplus-ipa-20130617
>=media-gfx/fontforge-20150612-r1
"

src_compile() {
	local generator_args=()
	use widen-line-space                       && generator_args+=("-w")
	use widen-line-space-extremely             && generator_args+=("-W")
	use disable-visible-zenkaku-space          && generator_args+=("-z")
	use disable-fullwidth-ambiguous-charactors && generator_args+=("-a")
	use disable-scaling-down-migu-1m           && generator_args+=("-s")

	./ricty_generator.sh -v $generator_args\
						 "${EPREFIX}/usr/share/fonts/inconsolata/Inconsolata-Regular.ttf"\
						 "${EPREFIX}/usr/share/fonts/inconsolata/Inconsolata-Bold.ttf"\
						 "${EPREFIX}/usr/share/fonts/mix-mplus-ipa/migu-1m-regular.ttf"\
						 "${EPREFIX}/usr/share/fonts/mix-mplus-ipa/migu-1m-bold.ttf"||\
		die

	if use oblique; then
		if use discord; then
			fontforge -script ./misc/regular2oblique_converter.pe Ricty*.ttf || die
		else
			fontforge -script ./misc/regular2oblique_converter.pe Ricty-*.ttf || die
		fi
	fi
}

src_install() {
	insinto /usr/share/fonts/$PN

	if use discord; then
		doins Ricty*.ttf
	else
		doins Ricty-*.ttf
	fi
}
