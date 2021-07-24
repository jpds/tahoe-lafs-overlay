# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7
PYTHON_COMPAT=( python3_{7,8,9} )
DISTUTILS_USE_SETUPTOOLS=rdepend
inherit distutils-r1

DESCRIPTION="Logging as Storytelling"
HOMEPAGE="https://github.com/ScatterHQ/eliot"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="doc test"

DEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/sphinx[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
RDEPEND="
	>=dev-python/boltons-19.0.1[${PYTHON_USEDEP}]
	>=dev-python/pyrsistent-0.11.8[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/zope-interface[${PYTHON_USEDEP}]
"

python_compile_all() {
	emake -C "${S}/docs" man
	use doc && emake -C "${S}/docs" html
}

python_install_all() {
	doman "${S}/docs/build/man/"*
	use doc && dohtml -r "${S}/docs/build/html/"*
}

python_test() {
	py.test || die "Tests fail with ${EPYTHON}"
}
