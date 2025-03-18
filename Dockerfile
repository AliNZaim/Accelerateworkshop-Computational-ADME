FROM python:3.8.10-slim

RUN apt-get update && apt-get -y install wget
RUN wget https://github.com/AliNZaim/Accelerateworkshop-Computational-ADME/archive/refs/heads/dev.zip && unzip dev.zip && rm dev.zip && pip install -r /Accelerateworkshop-Computational-ADME/requirements.txt

WORKDIR /Accelerateworkshop-Computational-ADME
CMD ["python", "--version"]
