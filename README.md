# AWS Elastic Beanstalk Demo

Deploying a [Dockerized](https://www.docker.com/) [Spring Boot](https://projects.spring.io/spring-boot/) application to [AWS Elastic Beanstalk](https://aws.amazon.com/elasticbeanstalk/).

## Getting started

1. Install the [AWS Elastic Beanstalk CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-install.html)

1. [Configure the AWS Elastic Beanstalk CLI](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/eb-cli3-configuration.html) as follows:

	* *Select a default region:* Any
	* *Select an application to use:* aws-eb-demo
	* *It appears you are using Docker. Is this correct?* Y
	* *Select a platform version:* Docker 17.09.1-ce
	* *Do you wish to continue with CodeCommit?* N
	* *Do you want to set up SSH for your instances?* N

1. Create the environment in AWS, selecting the defaults when prompted:

		eb create

	**WARNING: You will be charged for these resources until they are destroyed.**

1. Visit the outputted environment CNAME, e.g. http://aws-eb-demo-dev.eu-west-2.elasticbeanstalk.com/

## Manual deployment

To manually deploy the project to AWS:

	mvn clean package
	docker build -t markhobson/aws-eb-demo .
	docker login
	docker push markhobson/aws-eb-demo
	eb deploy

## Continuous Integration (CI)

We'll use [CircleCI](https://circleci.com) for continuous integration.

1. Add the project

1. Add environment variables for your Docker Hub credentials:

	* `DOCKER_REGISTRY_USERNAME`
	* `DOCKER_REGISTRY_PASSWORD`
	
1. Add environment variables for your AWS credentials and region:

	* `AWS_ACCESS_KEY_ID`
	* `AWS_SECRET_ACCESS_KEY`
	* `AWS_DEFAULT_REGION`

The CI job builds the project within the Docker container [.circleci/images/primary/Dockerfile](.circleci/images/primary/Dockerfile). To rebuild this:

	docker build -t markhobson/aws-eb-demo-primary .circleci/images/primary
	docker login
	docker push markhobson/aws-eb-demo-primary

## Destroying

To terminate the environment in AWS:

	eb terminate
