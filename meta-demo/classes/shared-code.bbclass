DESCRIPTION = "example shared class"
LICENSE = "CLOSED"
LIC_FILES_CHKSUM = ""

python() {
    print(d.getVar('PV'), d.getVar('PN'))
}

VERSION ?= "branch=develop"

SRC_URI = "repo://git@github.com/Jasper-Ben/demo-repo.git;protocol=https;${VERSION};scmdata=keep"

SRCREV = "5f6d334488c608d29fa1f1dbfa905da04287b800"
PV = "git+${SRCPV}"
