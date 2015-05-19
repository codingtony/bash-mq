SHELL := /bin/bash
NAME=bash-mq
VERSION=$(shell date +'%Y%m%d%H%M%S')
RELEASE=$(shell git rev-parse --short HEAD)
TMPDIR=$(shell pwd)/.rpmbuild

all : clean rpm

clean :
	rm -f *.rpm
	rm -rf ${TMPDIR}
rpm:
	mkdir -p ${TMPDIR}/{BUILD,BUILDROOT,RPMS,SOURCES,SPECS,SRPMS}
	sed -e "s/%RELEASE%/${RELEASE}/g" -e "s/%VERSION%/${VERSION}/g" -e "s/%NAME%/${NAME}/g" ${NAME}.spec > ${TMPDIR}/SPECS/${NAME}.spec
	tar -czf ${TMPDIR}/SOURCES/${NAME}.tar.gz --exclude='.git' --exclude='.rpmbuild' .
	rpmbuild -vv -bb --define "_topdir ${TMPDIR}" --define "_name ${NAME}" ${TMPDIR}/SPECS/${NAME}.spec

