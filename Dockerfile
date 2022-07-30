# FROM ubuntu:22.04

# RUN apt-get update && apt-get -y upgrade \
#   && apt-get install -y --no-install-recommends \
#     git \
#     wget \
#     g++ \
#     ca-certificates \
#     && rm -rf /var/lib/apt/lists/*
# ENV PATH="/root/miniconda3/bin:${PATH}"
# ARG PATH="/root/miniconda3/bin:${PATH}"

# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#     && mkdir /root/.conda

# RUN bash Miniconda3-latest-Linux-x86_64.sh -b \
#     && rm -f Miniconda3-latest-Linux-x86_64.sh 

# RUN conda init bash

# RUN conda update conda && \
#     conda create --name python-app python=3.9 && \
#     conda activate python-app && \
#     conda install python=3.9 pip

# WORKDIR /sentiment-model

# RUN pip install --upgrade pip
# COPY ./requirements.txt .
# RUN pip install -r requirements.txt

# COPY . /sentiment-model

# FROM ubuntu:22.04
FROM python:3.9

WORKDIR /sentiment-model

RUN pip install --upgrade pip
RUN pip install tea "cup >= 3.13"
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . /sentiment-model


CMD [ "python3", "run_pipeline.py" ]
