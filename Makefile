DOCKER_BASE=sbrunner/vaudtax
YEAR?=2022


.PHONY: rm-volumes
rm-volumes:
	docker volume rm vaudtax-$(YEAR)

.PHONY: bash
bash:
	docker run --rm -ti --env=DISPLAY=${DISPLAY} --ipc=host --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=${HOME}/Documents/vaudtax:/home/vaudtax $(DOCKER_BASE):${YEAR} bash

.PHONY: run
run:
	xhost +
	docker run --rm -ti --env=DISPLAY=${DISPLAY} --ipc=host --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=${HOME}/Documents/vaudtax:/home/vaudtax $(DOCKER_BASE):${YEAR}

.PHONY: build
build:
	docker build --tag=$(DOCKER_BASE):${YEAR} ${YEAR}

.PHONY: get-sha
get-sha:
	curl https://vaudtax-dl.vd.ch/vaudtax${YEAR}/telechargement/linux/64bit/VaudTax_${YEAR}.SHA256 \
		--output ${YEAR}/VaudTax_${YEAR}.SHA256
	curl https://vaudtax-dl.vd.ch/vaudtax${YEAR}/telechargement/linux/64bit/VaudTax_${YEAR}.asc \
		--output ${YEAR}/VaudTax_${YEAR}.asc

.PHONY: get
get: get-sha
	curl https://vaudtax-dl.vd.ch/vaudtax${YEAR}/telechargement/linux/64bit/VaudTax_${YEAR}.tar.gz \
		--output ${YEAR}/VaudTax_${YEAR}.tar.gz
	cd ${YEAR}; sha256sum --check VaudTax_${YEAR}.SHA256

.PHONY: push
push:
	docker push $(DOCKER_BASE):${YEAR}

.PHONY: push-github
push-github:
	docker tag $(DOCKER_BASE):${YEAR} ghcr.io/$(DOCKER_BASE):${YEAR}
	docker push ghcr.io/$(DOCKER_BASE):${YEAR}


