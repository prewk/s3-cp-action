FROM python:3.8-alpine

LABEL "com.github.actions.name"="S3 cp"
LABEL "com.github.actions.description"="Copy from/to AWS S3"
LABEL "com.github.actions.icon"="refresh-cw"
LABEL "com.github.actions.color"="green"

LABEL version="0.1.0"
LABEL repository="https://github.com/prewk/s3-cp-action"
LABEL maintainer="Oskar Thornblad <oskar.thornblad@gmail.com>"

# https://github.com/aws/aws-cli/blob/master/CHANGELOG.rst
ENV AWSCLI_VERSION='1.17.1'

RUN pip install --quiet --no-cache-dir awscli==${AWSCLI_VERSION}

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]