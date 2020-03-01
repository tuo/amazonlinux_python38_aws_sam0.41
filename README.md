# amazonlinux_python3.8 AWS SAM CLI 0.41.0

refer to : (https://github.com/tuo/amazonlinux_python38_aws_sam0.41.git)
Docker image with amazonlinux2 and Python3 installed.

Python 3.8.0 is installed by the install script, but a different version can be
installed by passing the desired version number to the install script in the
docker file.

Note: Amazonlinux2 comes with Python2.7.14 installed.

aws-sam-cli 0.41.0

### Purpose

added aws sam 0.41.0 as we want to have sam build in buildspec.yml as part of CodeBuild.

But we don't want to run `pip install aws-sam-cli==0.41.0` in our pre-build scripts.


### ECR:

```
export _DOCKER_REPO="$(aws ecr get-authorization-token --output text  --query 'authorizationData[].proxyEndpoint')"

aws ecr get-login --no-include-email --region cn-north-1 | awk '{print $6}' | 
docker login -u AWS --password-stdin $_DOCKER_REPO

docker build -t serverless .

docker tag serverless:latest 975754580786.dkr.ecr.cn-north-1.amazonaws.com.cn/serverless:latest
```


Then set its permission to allow codebuild access in sidebar:

https://docs.aws.amazon.com/codebuild/latest/userguide/sample-ecr.html

### GO TO CODEBUILD

and select custom image in evironemnet

and select Project Role

<img width="1440" alt="Screenshot 2020-03-01 at 21 41 08" src="https://user-images.githubusercontent.com/491610/75626774-432f8100-5c05-11ea-8087-8abfd531be55.png">
