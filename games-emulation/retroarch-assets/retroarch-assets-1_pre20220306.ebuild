# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

LIBRETRO_REPO_NAME="libretro/${PN}"
LIBRETRO_COMMIT_SHA="db5f4f4babb7f6f9c7edd27690c3ffa911cc9b24"

DESCRIPTION="Assets needed for RetroArch. Also contains the official branding."
HOMEPAGE="https://github.com/libretro/retroarch-assets"
SRC_URI="https://github.com/${LIBRETRO_REPO_NAME}/archive/${LIBRETRO_COMMIT_SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="CC-BY-4.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="materialui ozone rgui xmb"

src_prepare() {
	default

	sed -i -e "s/libretro/retroarch/g" Makefile || die

	declare -A FLAGS=( [materialui]=glui [ozone]= [rgui]= [xmb]= )
	for flag in "${!FLAGS[@]}"; do
		if ! use "${flag}"; then
			local folder="${FLAGS[$flag]:-$flag}"
			rm -r "${folder}" || die
		fi
	done
}
