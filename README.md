# amazonlinux_python3
Docker image with amazonlinux2 and Python3 installed.

Python 3.8.0 is installed by the install script, but a different version can be
installed by passing the desired version number to the install script in the
docker file.

Note: Amazonlinux2 comes with Python2.7.14 installed.

aws-sam-cli 0.41.0



### ECR:


export _DOCKER_REPO="$(aws ecr get-authorization-token --output text  --query 'authorizationData[].proxyEndpoint')"
aws ecr get-login --no-include-email --region cn-north-1 | awk '{print $6}' | docker login -u AWS --password-stdin $_DOCKER_REPO
docker build -t serverless .
docker tag serverless:latest 975754580786.dkr.ecr.cn-north-1.amazonaws.com.cn/serverless:latest



Then set its permission to allow codebuild access in sidebar:

https://docs.aws.amazon.com/codebuild/latest/userguide/sample-ecr.html

### GO TO CODEBUILD

and select custom image in evironemnet

and select Project Role