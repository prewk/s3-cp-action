# GitHub Action to S3 cp

Borrowed most of it from [jakejarvis/s3-sync-action](https://github.com/jakejarvis/s3-sync-action).

## Usage

```
name: Download a file from S3

on:
  push:
    branches:
    - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: prewk/s3-cp-action@master
      env:
        AWS_ACCESS_KEY_ID: ${{ secrets.AWS_ACCESS_KEY_ID }}
        AWS_SECRET_ACCESS_KEY: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        AWS_REGION: 'us-west-1' # optional: defaults to us-east-1
        SOURCE: 's3://some-bucket/something-remote'
        DEST: './something-local'
```