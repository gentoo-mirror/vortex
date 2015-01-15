# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit cmake-utils nsplugins

DESCRIPTION="PPAPI-host NPAPI-plugin adapter"
HOMEPAGE="https://github.com/i-rinat/freshplayerplugin"
SRC_URI="https://github.com/i-rinat/${PN}/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pulseaudio"

RDEPEND="
	dev-libs/libconfig
	dev-libs/libevent[threads]
	dev-util/ragel
	media-libs/alsa-lib
	media-libs/mesa[gles2]
	x11-libs/gtk+
	x11-libs/pango

	pulseaudio? ( media-sound/pulseaudio )

	!www-plugins/adobe-flash
	|| (
	    www-plugins/chrome-binary-plugins[flash]
	    www-client/google-chrome
	    www-client/google-chrome-beta
	    www-client/google-chrome-unstable
	)
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"

DOCS=( ChangeLog README.md )

src_install() {
	default

	insinto /etc
	doins data/freshwrapper.conf.example

	exeinto /usr/$(get_libdir)/${PLUGINS_DIR}
	doexe ${BUILD_DIR}/libfreshwrapper-pepperflash.so
}
