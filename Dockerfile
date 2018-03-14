FROM openjdk:8
WORKDIR /opt/aws-eb-demo
COPY target/aws-eb-demo-1.0.0-SNAPSHOT.jar .
ENTRYPOINT ["java",\
	"-jar",\
	"aws-eb-demo-1.0.0-SNAPSHOT.jar"]
EXPOSE 8080
