EAPI=4

DESCRIPTION=""
HOMEPAGE=""

SRC_URI=""
LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"

S=${WORKDIR}/${PN}

scr_compile()
{
    emake || die
}

scr_install()
{
    emake DESTDIR="${D}" install || die
}
