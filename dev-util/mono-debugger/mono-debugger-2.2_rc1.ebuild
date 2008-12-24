# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-util/mono-debugger/mono-debugger-2.0.ebuild,v 1.1 2008/11/19 22:35:58 loki_val Exp $

EAPI=2

inherit eutils mono

DESCRIPTION="Debugger for .NET managed and unmanaged applications"
HOMEPAGE="http://www.go-mono.com"
SRC_URI="http://mono.ximian.com/monobuild/preview/sources/mono-debugger/${P%_pre*} -> ${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/mono-${PV}
	sys-libs/readline
	dev-libs/glib:2"
DEPEND="${RDEPEND}
	>=dev-util/pkgconfig-0.20"

RESTRICT="test"

S=${WORKDIR}/${P%_pre*}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc README ChangeLog AUTHORS NEWS
}