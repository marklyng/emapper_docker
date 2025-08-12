# emapper 2.1.13 docker image

This is a custom Dockerfile for building an image of EggNogMapper.

**I have no affiliation with EggNogMapper or the development team. I am just a user.**

This image builds in ~30min and is 93.1GB large. 
It contains only the base database required to run emapper with Diamond2. i.e. the Dockerfile runs `download_eggnog_data.py -y`
These are the database versions:
- emapper-2.1.13 
- eggNOG DB version: 5.0.2 
- diamond version: 2.1.13
- MMseqs2 version: 18.8cc5c 
- Compatible novel families DB version: 1.0.1
The databases are placed in `/data/eggnog-mapper-data` which is available in the environment variable `EGGNOG_DATA_DIR`. I.e. no need to specify `--data_dir`

If you want to use `hmmr` or other advanced features, you may have to build the database yourself and supply it as a bind mount accessible via `--data_dir`.

Download the pre-built image from [Dockerhub](https://hub.docker.com/repository/docker/marklyng/emapper/general "marklyng/emapper"). Additional tags may be added sporadically.

Run with 
`docker run --rm marklyng/emapper:2.1.13 emapper.py [ARGS]` like stated in <https://docs.antismash.secondarymetabolites.org/command_line/>

Use `--rm` to stop and remove the container once it has finished running <https://docs.docker.com/reference/cli/docker/container/rm/>

```
#E.g.
docker run --rm marklyng/emapper:2.1.13 emapper.py -h
```

You can bind mount directories as seen fit. Again, databases are not necessary - they are included in the container.
<https://docs.docker.com/engine/storage/bind-mounts/>

```
#E.g.
docker run --rm \
	-v /path/to/input:/data \
	-v /path/to/output:/output \
	marklyng/emapper:2.1.13 \
	emapper.py \
	-i /data/input.faa \
	--cpu 8 \
	--sensmode sensitive \
	--excel \
	--output-dir /output
```


See <https://github.com/eggnogdb/eggnog-mapper/> for actual information about the software.
