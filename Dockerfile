FROM python:3.6

RUN apt-get update && apt-get install -y \
  python3-pip binutils libgdal-dev python-gdal\
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set project dirs
ENV APP_DIR=/usr/src/django-rest-swagger-docstring
RUN mkdir -p ${APP_DIR}
WORKDIR ${APP_DIR}

RUN pip3 install --upgrade pip

COPY requirements.txt ${APP_DIR}
RUN pip3 install --no-cache-dir -r requirements.txt

COPY . ${APP_DIR}

EXPOSE 8000