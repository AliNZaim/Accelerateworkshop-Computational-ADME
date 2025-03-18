FROM continuumio/miniconda3
#python:3.14.0a6-bookworm

RUN apt-get update && apt-get -y install wget #gfortran libxml2-dev libcurl4-openssl-dev libssl-dev liblapack-dev libblas-dev cmake libopenblas-dev pkg-config libopenblas64-dev

ARG CACHEBUST
RUN echo "$CACHEBUST"
RUN wget https://github.com/AliNZaim/Accelerateworkshop-Computational-ADME/archive/refs/heads/dev.zip && unzip dev.zip && rm dev.zip
#RUN bash /Accelerateworkshop-Computational-ADME-dev/prep/install-libgfortran3.sh
RUN conda install --yes --file /Accelerateworkshop-Computational-ADME-dev/requirements.txt

WORKDIR /Accelerateworkshop-Computational-ADME-dev
CMD ["python", "--version"]
