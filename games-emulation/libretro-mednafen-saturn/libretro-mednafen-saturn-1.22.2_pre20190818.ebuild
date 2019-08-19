# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

LIBRETRO_REPO_NAME="libretro/beetle-saturn-libretro"
LIBRETRO_COMMIT_SHA="35e8cd757fde92dea66a42583961bf3e6deb24b8"

inherit libretro-core

DESCRIPTION="Standalone port of Mednafen Saturn to the libretro API"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
