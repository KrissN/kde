# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_DOXYGEN="true"
KDE_TEST="true"
QT_MINIMAL="5.6.0"
inherit kde5

DESCRIPTION="Library for interacting with IMAP servers"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="
	$(add_frameworks_dep kcodecs)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kio)
	$(add_kdeapps_dep kmime)
	dev-libs/cyrus-sasl
	$(add_qt_dep qtgui)
"
RDEPEND="${DEPEND}"
