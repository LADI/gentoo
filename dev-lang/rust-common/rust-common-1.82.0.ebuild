# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1

DESCRIPTION="Common files shared between multiple slots of Rust"
HOMEPAGE="https://www.rust-lang.org/"

if [[ ${PV} = *beta* ]]; then
	betaver=${PV//*beta}
	BETA_SNAPSHOT="${betaver:0:4}-${betaver:4:2}-${betaver:6:2}"
	SRC="${BETA_SNAPSHOT}/rustc-beta-src.tar.xz -> rustc-${PV}-src.tar.xz"
else
	ABI_VER="$(ver_cut 1-2)"
	MY_P="rustc-${PV}"
	SRC="${MY_P}-src.tar.xz"
fi

SRC_URI="
	https://static.rust-lang.org/dist/${SRC}
	verify-sig? ( https://static.rust-lang.org/dist/${SRC}.asc )
"
S="${WORKDIR}/${MY_P}-src"

LICENSE="|| ( MIT Apache-2.0 ) BSD BSD-1 BSD-2 BSD-4"
SLOT=0
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~mips ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE="verify-sig"

# Legacy non-slotted versions bash completions will collide.
RDEPEND="
	!dev-lang/rust:stable/1.71.1
	!dev-lang/rust:stable/1.74.1
	!dev-lang/rust:stable/1.75.0
	!dev-lang/rust:stable/1.77.1
	!dev-lang/rust:stable/1.79.0
	!dev-lang/rust:stable/1.80.1
	!dev-lang/rust:stable/1.81.0
	!dev-lang/rust:stable/1.82.0
"

src_configure() {
	:
}

src_compile() {
	:
}

src_install() {
	newbashcomp src/tools/cargo/src/etc/cargo.bashcomp.sh cargo
}
