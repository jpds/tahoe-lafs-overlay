# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

# TODO: test 7 8 9
PYTHON_COMPAT=( python2_{6,7} python3_{3,4,7,8,9} )
inherit distutils-r1

DESCRIPTION="This module implements the HMAC Key Derivation function"
HOMEPAGE="https://github.com/casebeer/python-hkdf"
SRC_URI="https://github.com/casebeer/${PN}/archive/ba0e2eee8f50cc84706f816dbc57897319e2250c.zip -> ${P}.zip"

S="${WORKDIR}/${PN}-ba0e2eee8f50cc84706f816dbc57897319e2250c"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"
