FROM ghcr.io/mamba-org/micromamba:git-9d20aae-amazon2023
# https://micromamba-docker.readthedocs.io/en/latest/quick_start.html

RUN micromamba install --yes unzip && micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1

ARG CACHEBUST
RUN echo "$CACHEBUST"
ADD https://github.com/AliNZaim/Accelerateworkshop-Computational-ADME/archive/refs/heads/dev.zip /
USER root
RUN unzip /dev -d / && rm /dev.zip
#RUN micromamba lock -p linux-64 -f /Accelerateworkshop-Computational-ADME-dev/environment.yml && micromamba create --name adme-dock --file mamba-linux-64.lock

WORKDIR /Accelerateworkshop-Computational-ADME-dev
RUN micromamba install -y -n base -f environment.yaml && micromamba clean --all --yes
USER mambauser
CMD ["python", "--version"]
