# Base image
FROM ubuntu:20.04

# Label
LABEL MAINTAINER Viral Patel <viralp2121@gmail.com> Name=ncs-docker

# Arguments
ARG name=defaultValue

# Install Python on image
RUN \
    apt-get update && \
    apt-get install -y python3  && \
    apt-get install -y build-essential

    # python3-pip python3-dev python3-venv && rm -rf /var

# Create a directory for our tests
RUN mkdir /tests

# Copy in out python script
COPY test.py /tests/test.py

# Copy in out program under test
COPY main.c /tests/main.c

# Command that will be invoked when the container starts
ENTRYPOINT [ "python3", "tests/test.py" ]
