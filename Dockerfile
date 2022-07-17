FROM python:3.9-slim

WORKDIR /sentiment-model

RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

COPY . /sentiment-model

CMD [ "python3", "run_pipeline.py" ]