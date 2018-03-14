# AWS Elastic Beanstalk Demo

Deploying a Dockerized Spring Boot application to AWS Elastic Beanstalk.

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

## Destroying

To terminate the environment in AWS:

	eb terminate
