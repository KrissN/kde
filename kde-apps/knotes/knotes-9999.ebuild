# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

KDE_HANDBOOK="forceoptional"
KDE_PIM_KONTACTPLUGIN="true"
KDE_TEST="forceoptional"
KMNAME="kdepim"
QT_MINIMAL="5.6.0"
VIRTUALX_REQUIRED="test"
inherit kde5

DESCRIPTION="KDE Notes application"
HOMEPAGE="https://www.kde.org/"
KEYWORDS=""

IUSE=""

DEPEND="
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kcompletion)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep kdelibs4support)
	$(add_frameworks_dep kdnssd)
	$(add_frameworks_dep kglobalaccel)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep kitemmodels)
	$(add_frameworks_dep knewstuff)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep ktextwidgets)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kwindowsystem)
	$(add_frameworks_dep kxmlgui)
	$(add_kdeapps_dep akonadi)
	$(add_kdeapps_dep akonadi-notes)
	$(add_kdeapps_dep akonadi-search)
	$(add_kdeapps_dep kmime)
	$(add_kdeapps_dep pimcommon)
	$(add_qt_dep qtdbus)
	$(add_qt_dep qtgui)
	$(add_qt_dep qtprintsupport)
	$(add_qt_dep qtwidgets)
	$(add_qt_dep qtx11extras)
	$(add_qt_dep qtxml)
	dev-libs/grantlee:5
	dev-libs/libxslt
	x11-libs/libX11
	kontact? (
		$(add_frameworks_dep kitemviews)
		$(add_frameworks_dep kparts)
		$(add_kdeapps_dep kcalcore)
		$(add_kdeapps_dep kcalutils)
		$(add_kdeapps_dep kcontacts)
		$(add_kdeapps_dep libkdepim)
	)
"
RDEPEND="${DEPEND}
	!<kde-apps/kdepim-15.12.2:5
	!kde-apps/noteshared:5
"

if [[ ${KDE_BUILD_TYPE} = live ]] ; then
	S="${WORKDIR}/${P}/${PN}"
else
	S="${WORKDIR}/${KMNAME}-${PV}/${PN}"
fi

src_prepare() {
	# knotes subproject does not contain doc
	# at least until properly split upstream
	echo "add_subdirectory(doc)" >> CMakeLists.txt || die "Failed to add doc dir"

	mkdir doc || die "Failed to create doc dir"
	mv ../doc/${PN} doc || die "Failed to move handbook"
	mv ../doc/akonadi_notes_agent doc || die "Failed to move handbook"
	cat <<-EOF > doc/CMakeLists.txt
add_subdirectory(${PN})
add_subdirectory(akonadi_notes_agent)
EOF

	kde5_src_prepare
}

src_configure() {
# 	local mycmakeargs=(
# 	# FIXME: Does not build (last checked 2016-02-17)
# 		$(cmake-utils_use_find_package X Qt5X11Extras)
# 		$(cmake-utils_use_find_package X X11)
# 	)

	kde5_src_configure
}
