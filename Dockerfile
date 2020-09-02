#FROM openjdk:8-jdk-alpine
#VOLUME /tmp
#COPY target/heroku-docker-test-1.0.jar heroku-docker-test-1.0.jar
#CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/heroku-docker-test-1.0.jar"]
#EXPOSE 8080

FROM openjdk:8-jdk-alpine

ARG JAR_FILE

RUN mkdir -p /apps
COPY ./target/${JAR_FILE} /apps/heroku-docker-test-01-1.jar
COPY ./entrypoint.sh /apps/entrypoint.sh

RUN chmod +x /apps/entrypoint.sh
CMD ["/apps/entrypoint.sh"]