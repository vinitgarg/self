FROM tomcat:8.5-alpine
ADD target/second_mvn.war /usr/local/tomcat/webapps/
COPY tomcat-users.xml /usr/local/tomcat/conf/
EXPOSE 8080
CMD ["catalina.sh", "run"]

