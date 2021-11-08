# SPDX-License-Identifier: MIT
# Copyright (C) 2021 iris-GmbH infrared & intelligent sensors

USER_ID 	?= $(shell id -u)
GROUP_ID 	?= $(shell id -g)
KAS_COMMAND ?= USER_ID=$(USER_ID) GROUP_ID=$(GROUP_ID) docker-compose run --rm kas

.PHONY: build clean fetch-only offline-build

build:
	${KAS_COMMAND} shell -c 'bitbake foo-a' kas-poky.yml

clean:
	${KAS_COMMAND} shell -c 'rm -rf $${BUILDDIR}' kas-poky.yml

fetch-only:
	${KAS_COMMAND} shell -c 'bitbake foo-a --runonly=fetch' kas-poky.yml

offline-build: fetch-only
	${KAS_COMMAND} shell -c 'bitbake foo-a' kas-poky.yml:kas-offline-build.yml
