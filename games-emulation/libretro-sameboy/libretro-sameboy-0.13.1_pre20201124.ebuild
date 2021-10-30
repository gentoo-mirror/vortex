# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/SameBoy"
LIBRETRO_COMMIT_SHA="f07b50968a473d13b201afc9d890b44ff33a7d19"

inherit libretro-core

DESCRIPTION="Gameboy and Gameboy Color emulator written in C"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=">=sys-devel/rgbds-0.4.0"

S="${S}/libretro"

src_prepare() {
	libretro-core_src_prepare
	pushd .. > /dev/null || die
	eapply "${FILESDIR}/${PN}-multithread-make.patch"
	popd || die
}

src_compile() {
	local myemakeargs=(
		"VERSION=${PV}"
		-j1
	)
	libretro-core_src_compile
}

src_install() {
	LIBRETRO_CORE_LIB_FILE="${S}/../build/bin/${LIBRETRO_CORE_NAME}_libretro.so" \
		libretro-core_src_install
}
