# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_{6,7,8,9} )
inherit distutils-r1

DESCRIPTION="Get things from one computer to another, safely"
HOMEPAGE="
	https://github.com/magic-wormhole/magic-wormhole
	https://magic-wormhole.readthedocs.io/
"
SRC_URI="https://github.com/${PN}/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RDEPEND="
	~dev-python/python-spake2-0.8
	dev-python/pynacl
	dev-python/six
	>=dev-python/attrs-19.2.0
	>=dev-python/twisted-17.5.0
	>=dev-python/autobahn-0.14.1
	dev-python/automat
	dev-python/python-hkdf
	>=dev-python/tqdm-4.13.0
	dev-python/click
	dev-python/humanize
	>=dev-python/txtorcon-18.0.2
"
DEPEND="
	${RDEPEND}
	test? ( dev-python/mock
			net-misc/magic-wormhole-mailbox-server
			net-misc/magic-wormhole-transit-relay )
"

# TODO: get tests to work on first install
distutils_enable_tests setup.py
