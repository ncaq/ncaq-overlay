# Public Domain

EAPI=6

DESCRIPTION="japanese font for programming. use Inconsolata and Migu 1M."
HOMEPAGE="http://www.rs.tus.ac.jp/yyusa/ricty.html"
SRC_URI="
http://www.rs.tus.ac.jp/yyusa/ricty/ricty_generator.sh -> ricty_generator.sh
http://www.rs.tus.ac.jp/yyusa/ricty/os2version_reviser.sh -> os2version_reviser.sh
"

LICENSE="OFL IPAfont"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86 ~amd64-fbsd ~x86-fbsd ~x86-freebsd ~amd64-linux ~x86-linux ~ppc-macos ~x86-macos"
IUSE="
disable-fullwidth-ambiguous-charactors
disable-scaling-down-migu-1m
disable-visible-zenkaku-space
discord
widen-line-space
widen-line-space-extremely
"

DEPEND="
>=media-fonts/inconsolata-20140821
>=media-fonts/mix-mplus-ipa-20130617
>=media-gfx/fontforge-20150612-r1
"
RDEPEND="${DEPEND}"

RESTRICT="mirror"

src_unpack() {
	mkdir $S
	for a in ${A} ; do
		cp ${DISTDIR}/$a $S
	done
}

src_compile() {
	local generator_args=()
	use widen-line-space                       && generator_args+=("-w")
	use widen-line-space-extremely             && generator_args+=("-W")
	use disable-visible-zenkaku-space          && generator_args+=("-z")
	use disable-fullwidth-ambiguous-charactors && generator_args+=("-a")
	use disable-scaling-down-migu-1m           && generator_args+=("-s")

	bash ricty_generator.sh -v $generator_args\
		 "${EPREFIX}/usr/share/fonts/inconsolata/Inconsolata-Regular.ttf"\
		 "${EPREFIX}/usr/share/fonts/inconsolata/Inconsolata-Bold.ttf"\
		 "${EPREFIX}/usr/share/fonts/mix-mplus-ipa/migu-1m-regular.ttf"\
		 "${EPREFIX}/usr/share/fonts/mix-mplus-ipa/migu-1m-bold.ttf"||\
		die
}

src_install() {
	insinto /usr/share/fonts/$PN

	if use discord; then
		doins Ricty*.ttf
	else
		doins Ricty-*.ttf
	fi
}
