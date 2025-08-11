
FROM mambaorg/micromamba:2.0.8-ubuntu22.04 AS app

ARG EGGNOGMAPPER_VER="2.1.13"

# 'LABEL' instructions tag the image with metadata that might be important to the user
LABEL base.image="ubuntu:jammy"
LABEL dockerfile.version="1"
LABEL software="EggNogMapper"
LABEL software.version="${EGGNOGMAPPER_VER}"
LABEL description="Fast functional annotation of novel sequences"
LABEL website="https://github.com/eggnogdb/eggnog-mapper/wiki/"
LABEL license="https://github.com/eggnogdb/eggnog-mapper/blob/master/LICENSE.txt"
LABEL maintainer.image="Mark Lyng"
LABEL maintainer.image.email="ml@nordicmicrobes.dk"

USER root

# 'RUN' executes code during the build
# Install dependencies via apt-get or yum if using a centos or fedora base
RUN apt-get update && apt-get install -y --no-install-recommends \ 
    ca-certificates \
    && apt-get autoclean && rm -rf /var/lib/apt/lists/*

ENV PATH="/opt/conda/bin:$PATH" \
    LC_ALL=C


RUN micromamba install --name base -c conda-forge -c bioconda eggnog-mapper=${EGGNOGMAPPER_VER} && \
    download_eggnog_data.py -y && \
    micromamba clean -a -f -y && \
    mkdir /data

CMD ["emapper.py", "--help"]

WORKDIR /data

FROM app AS test

WORKDIR /test

RUN emapper.py --help && \
    emapper.py --version

RUN micromamba list