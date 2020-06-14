FROM python:3.7-alpine
MAINTAINER Safuente

# Avoid output buffer python in console
ENV PYTHONBUFFERED 1

# Copy requirements to container
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
# Copy from local machine to container
COPY ./app /app

# Create user to run app
RUN adduser -D user
# Asign user to user created
USER user