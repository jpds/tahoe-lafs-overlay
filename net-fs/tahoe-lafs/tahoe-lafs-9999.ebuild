# Copyright 1999-2018 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

PYTHON_COMPAT=( python3_9 )

DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

MY_PN="allmydata-tahoe"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Secure, decentralized, data store"
HOMEPAGE="https://tahoe-lafs.org/trac/tahoe-lafs"

if [[ ${PV} == 9999 ]] ; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/tahoe-lafs/tahoe-lafs.git"
else
	SRC_URI="https://tahoe-lafs.org/source/tahoe-lafs/releases/${MY_P}.tar.bz2"
	KEYWORDS="~amd64 ~arm64 ~x86"
fi

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="doc"

RDEPEND="
	>=dev-python/appdirs-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-18.2.0[${PYTHON_USEDEP}]
	>=dev-python/autobahn-19.5.2[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/characteristic-14.0.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-3.11[${PYTHON_USEDEP}]
	>=dev-python/eliot-1.13.0[${PYTHON_USEDEP}]
	>=dev-python/foolscap-21.7[${PYTHON_USEDEP}]
	dev-python/future[${PYTHON_USEDEP}]
	dev-python/netifaces[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.1.8[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.6[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-0.14[${PYTHON_USEDEP}]
	>=dev-python/pyutil-3.3.0[${PYTHON_USEDEP}]
	dev-python/service_identity[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/simplejson[${PYTHON_USEDEP}]
	>=dev-python/twisted-19.10.0[${PYTHON_USEDEP}]
	>=dev-python/zfec-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/zope-interface-3.6.0[${PYTHON_USEDEP}]
	>=net-misc/magic-wormhole-0.10.2[${PYTHON_USEDEP}]"
DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]"

#S="${WORKDIR}/${MY_P}"

#src_prepare() {
#	distutils-r1_src_prepare
#}

src_install() {
	distutils-r1_src_install
	use doc && dodoc -r docs/*
}
