FROM python:3.8-slim-buster

WORKDIR /python-docker

COPY requirements.txt requirements.txt
RUN  pip install --upgrade setuptools
RUN apt-get update && apt-get install libssl-dev
RUN apt-get install -y python3-dev
RUN apt-get install -y default-libmysqlclient-dev
RUN apt-get install -y build-essential
RUN pip3 install -r requirements.txt
COPY . .

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]