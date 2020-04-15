FROM tomcat:8.5-alpine
ADD target/second_mvn.war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]



