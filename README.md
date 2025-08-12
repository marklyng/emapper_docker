# emapper 2.1.13 docker image

This is a custom Dockerfile for building an image of EggNogMapper.

**I have no affiliation with EggNogMapper or the development team. I am just a user.**

This image builds in ~70s and is 1.2GB large. 
It contains only the base database required to run Diamond2. i.e. the Dockerfile runs `download_eggnog_data.py -y`

Download the pre-built image from [Dockerhub](https://hub.docker.com/repository/docker/marklyng/emapper/general "marklyng/emapper"). Additional tags may be added sporadically.

Run with 
`docker run --rm marklyng/emapper:2.1.13 emapper.py [ARGS]` like stated in <https://docs.antismash.secondarymetabolites.org/command_line/>

Use `--rm` to stop the container once it has finished running <https://docs.docker.com/reference/cli/docker/container/rm/>

```
#E.g.
docker run --rm marklyng/antismash:8.0.1 antismash --help
```

You can bind mount directories as seen fit. Again, databases are not necessary - they are included in the container.
<https://docs.docker.com/engine/storage/bind-mounts/>

```
#E.g.
docker run --rm \
	-v /path/to/.gbk-dir:/data \
	-v /path/to/output:/output \
	marklyng/antismash:8.0.1 \
	antismash \
	-t bacteria \
	-c 8 \
	--output-dir /output \
	/data/input.gbk 
```


See <https://antismash.secondarymetabolites.org/#!/about> for actual information about the software.
