FROM python:2.7
RUN apt-get update
RUN apt-get -y install python-dev 
RUN apt-get -y install protobuf-compiler libprotobuf-dev
ADD . /code
WORKDIR /code
RUN pip install --no-cache-dir -r requirements.txt
ENTRYPOINT ["/code/docker-entrypoint.sh"]
CMD ["python"]
