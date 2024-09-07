# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..13} pypy3 )
inherit distutils-r1 pypi

DESCRIPTION="Stemmer algorithms generated from Snowball algorithms"
HOMEPAGE="
	https://snowballstem.org/
	https://github.com/snowballstem/snowball
	https://pypi.org/project/snowballstemmer/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~m68k ~mips ppc ppc64 ~riscv ~s390 sparc x86 ~x64-macos ~x64-solaris"
