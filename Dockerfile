FROM python:3.7-alpine
MAINTAINER Safuente

# Avoid output buffer python in console
ENV PYTHONBUFFERED 1

# Copy requirements to container
COPY ./requirements.txt /requirements.txt
# Add postgresql client to image
RUN apk add --update --no-cache postgresql-client
# Alias for deps installed, list of dependencies needed for db
RUN apk add --update --no-cache --virtual .tmp-build-deps \
    gcc libc-dev linux-headers postgresql-dev
RUN pip install -r /requirements.txt
# Remove temp deps
RUN apk del .tmp-build-deps

RUN mkdir /app
WORKDIR /app
# Copy from local machine to container
COPY ./app /app

# Create user to run app
RUN adduser -D user
# Asign user to user created
USER user
