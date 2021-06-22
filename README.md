# GitHub Action to S3 cp

Borrowed most of it from [jakejarvis/s3-sync-action](https://github.com/jakejarvis/s3-sync-action).

## Usage
To copy a file
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
    
    - name: Copy a file from s3
      uses: prewk/s3-cp-action@master
      with:
        aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        source: 's3://some-bucket/something-remote'
        dest: './something-local'
```

To copy a folder
```
name: Upload a folder to S3

on:
  push:
    branches:
    - master

jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    
    - name: Copy a folder to s3
      uses: prewk/s3-cp-action@master
      with:
        aws_access_key_id: ${{ secrets.AWS_ACCESS_KEY_ID }}
        aws_secret_access_key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
        source: './something-local'
        dest: 's3://some-bucket/something-remote'
        flags: --recursive
```

## Configuration

| Key | Value | Suggested Type | Required | Default |
| ------------- | ------------- | ------------- | ------------- | ------------- |
| `aws_access_key_id` | Your AWS Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret env` | **Yes** | N/A |
| `aws_secret_access_key` | Your AWS Secret Access Key. [More info here.](https://docs.aws.amazon.com/general/latest/gr/managing-aws-access-keys.html) | `secret env` | **Yes** | N/A |
| `source` | The local file (or s3 key) you wish to cp. | `env` | Yes | N/A |
| `dest` | The s3 key (or local file) you wish the file to be copied to. | `env` | Yes | N/A |
| `aws_region` | The region where you created your bucket. Set to `us-east-1` by default. [Full list of regions here.](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-regions-availability-zones.html#concepts-available-regions) | `env` | No | `us-east-1` |
| `aws_s3_endpoint` | The endpoint URL of the bucket you are coping to. Can be used for [VPC scenarios](https://aws.amazon.com/blogs/aws/new-vpc-endpoint-for-amazon-s3/) or for non-AWS services using the S3 API, like [DigitalOcean Spaces](https://www.digitalocean.com/community/tools/adapting-an-existing-aws-s3-application-to-digitalocean-spaces). | `env` | No | Automatic (`s3.amazonaws.com` or AWS's region-specific equivalent) |
| `flags` | The flags that you want to add | `env` | No | N/A |
