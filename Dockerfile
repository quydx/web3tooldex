FROM python:3.10.11

RUN apt-get update \
    && apt-get install git apt-utils -y \
    && apt install vim libpq-dev python-dev -y \
    && apt-get install -y --no-install-recommends gcc \
    && rm -rf /var/lib/apt/lists/*

ADD ./requirements.txt /tmp/requirements.txt

RUN pip install gunicorn[gevent] \
    && pip install -r /tmp/requirements.txt

ADD . /app-deploy


WORKDIR /app-deploy

RUN pip install -e .