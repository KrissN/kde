# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_AUTODEPS="false"
inherit kde5

DESCRIPTION="Shared icons, artwork and data files for educational applications"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND="
	$(add_frameworks_dep extra-cmake-modules)
	$(add_qt_dep qtcore)
"
RDEPEND="
	!kde-apps/libkdeedu:4
"
