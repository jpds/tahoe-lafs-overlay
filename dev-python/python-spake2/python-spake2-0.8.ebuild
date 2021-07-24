# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# TODO: test 7 8 9
PYTHON_COMPAT=( python2_7 python3_{3,4,5,6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Implements the SPAKE2 password-authenticated key exchange ("PAKE") algorithm"
HOMEPAGE="https://github.com/warner/python-spake2"
SRC_URI="https://github.com/warner/${PN}/archive/refs/tags/v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-python/python-hkdf"
DEPEND="${RDEPEND}"
