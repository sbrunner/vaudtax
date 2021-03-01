# VaudTax

Run VaudTax in a Docker container from version 2012

To run from Docker hub:

```
YEAR=2020
docker pull sbrunner/vaudtax:${YEAR}
VAUDTAX_DOCUMENTS=${HOME}/Documents/vaudtax
xhost +
docker run --rm -ti --env=DISPLAY=${DISPLAY} --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=${VAUDTAX_DOCUMENTS}:/home/vaudtax sbrunner/vaudtax:${YEAR}
```

To run from GitHub Container Registry:

```
YEAR=2020
docker pull chcr.io/sbrunner/vaudtax:${YEAR}
VAUDTAX_DOCUMENTS=${HOME}/Documents/vaudtax
xhost +
docker run --rm -ti --env=DISPLAY=${DISPLAY} --volume=/tmp/.X11-unix:/tmp/.X11-unix --volume=${VAUDTAX_DOCUMENTS}:/home/vaudtax chcr.io/sbrunner/vaudtax:${YEAR}
```
