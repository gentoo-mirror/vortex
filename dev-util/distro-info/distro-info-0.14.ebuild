# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

PYTHON_COMPAT=( python2_7 python3_{3,4,5} )
DISTUTILS_OPTIONAL=true

inherit distutils-r1

DESCRIPTION="Provides information about the Debian distributions' releases"
HOMEPAGE="https://debian.org"
SRC_URI="mirror://debian/pool/main/d/${PN}/${PN}_${PV}.tar.xz"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="python"

REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"

DEPEND="python? ( ${PYTHON_DEPS} )"
RDEPEND="${DEPEND}
	dev-util/distro-info-data
"

src_prepare() {
	sed -i "/cd python && python/d" Makefile || die
	sed -i "/\$(VENDOR)/d" Makefile || die
	sed -i "/VENDOR ?=/d" Makefile || die

	default
}

src_configure() {
	if use python ;then
		cd "${S}"/python || die
		distutils-r1_src_configure
	fi

	default
}

src_install() {
	default

	if use python ;then
		cd "${S}"/python || die
		distutils-r1_src_install
	fi
}
