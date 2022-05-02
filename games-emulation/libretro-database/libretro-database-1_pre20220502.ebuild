# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_COMMIT_SHA="c6cb0c43d1dbc78dbd7f9467e50690d4e128937e"

inherit vcs-snapshot

DESCRIPTION="Cheatcode files, content data files and etc. stuff for RetroArch"
HOMEPAGE="https://github.com/libretro/libretro-database"
SRC_URI="https://github.com/libretro/libretro-database/archive/${LIBRETRO_COMMIT_SHA}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

src_compile() {
	:
}
