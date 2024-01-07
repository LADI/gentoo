# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..12} )
PYTHON_REQ_USE='threads(+)'

inherit python-single-r1 waf-utils

DESCRIPTION="LADI Session Handler - a session management system for JACK applications"
HOMEPAGE="https://ladish.org"

SRC_URI="https://dl.ladish.org/ladish/${P}-g36c489e4.tar.bz2"
S="${WORKDIR}/${P}-g36c489e4"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="debug lash"

BDEPEND="
	virtual/pkgconfig
"
CDEPEND="
	virtual/jack
	media-sound/jack2[dbus]
	sys-apps/dbus
	dev-libs/expat
	lash? ( !media-sound/lash )
	${PYTHON_DEPS}
"
RDEPEND="${CDEPEND}"
DEPEND="${RDEPEND}"

DOCS=( AUTHORS NEWS README.adoc )

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# libalsapid.so is version-less by upstream design
QA_SONAME=( ".*/libalsapid.so" )

src_configure() {
	local -a mywafconfargs=(
		$(usex debug --debug '')
		$(usex lash '--enable-liblash' '')
	)
	waf-utils_src_configure "${mywafconfargs[@]}"
}
