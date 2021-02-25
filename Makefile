DOCKER_BASE=sbrunner/vaudtax

.PHONY: run
run: build
	xhost +
	docker run --rm -ti --env=DISPLAY=${DISPLAY} --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=${HOME}/Documents/vaudtax:/home/vaudtax $(DOCKER_BASE):${YEAR}

.PHONY: build
build:
	docker build --tag=$(DOCKER_BASE):${YEAR} ${YEAR}

.PHONY: push
push: build
	docker push $(DOCKER_BASE):${YEAR}

.PHONY: push-github
push-github: build
	docker tag $(DOCKER_BASE):${YEAR} ghcr.io/$(DOCKER_BASE):${YEAR}
	docker push ghcr.io/$(DOCKER_BASE):${YEAR}


