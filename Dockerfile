FROM tomcat:9.0

ADD src/ /helloworld/src
ADD pom.xml /helloworld

#  Build spring app

RUN apt update && apt install maven -y
WORKDIR /helloworld/
RUN mvn clean package

#  Deploy to tomcat
RUN mv target/helloworld.war /usr/local/tomcat/webapps/


EXPOSE 8080
CMD ["catalina.sh", "run"]

