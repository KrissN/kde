# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_DOXYGEN="true"
KDE_TEST="true"
QT_MINIMAL="5.6.0"
inherit kde5

DESCRIPTION="Library for accessing MBox format mail storages"
LICENSE="LGPL-2+"
KEYWORDS=""
IUSE=""

DEPEND="$(add_kdeapps_dep kmime)"
RDEPEND="${DEPEND}"
