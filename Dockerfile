FROM ghcr.io/mamba-org/micromamba:git-9d20aae-amazon2023
#python:3.14.0a6-bookworm
# https://micromamba-docker.readthedocs.io/en/latest/quick_start.html

RUN micromamba install --yes unzip && micromamba clean --all --yes
ARG MAMBA_DOCKERFILE_ACTIVATE=1
#RUN micromamba install wget unzip
#RUN apt-get update && apt-get -y install wget unzip
#gfortran libxml2-dev libcurl4-openssl-dev libssl-dev liblapack-dev libblas-dev cmake libopenblas-dev pkg-config libopenblas64-dev

ARG CACHEBUST
RUN echo "$CACHEBUST"
ADD https://github.com/AliNZaim/Accelerateworkshop-Computational-ADME/archive/refs/heads/dev.zip /
USER root
RUN unzip /dev #&& rm /dev.zip
#RUN wget https://github.com/AliNZaim/Accelerateworkshop-Computational-ADME/archive/refs/heads/dev.zip && unzip dev.zip && rm dev.zip
#RUN bash /Accelerateworkshop-Computational-ADME-dev/prep/install-libgfortran3.sh
#RUN conda config --add channels conda-forge
#RUN conda install --yes --file /Accelerateworkshop-Computational-ADME-dev/requirements.txt
#RUN micromamba lock -p linux-64 -f /Accelerateworkshop-Computational-ADME-dev/environment.yml && micromamba create --name adme-dock --file mamba-linux-64.lock

#RUN micromamba activate adme-dock
#WORKDIR /Accelerateworkshop-Computational-ADME-dev
CMD ["python", "--version"]
