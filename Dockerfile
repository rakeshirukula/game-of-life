FROM maven:3-jdk-8 as builder
RUN git clone https://github.com/rakeshirukula/game-of-life.git
RUN cd /game-of-life
WORKDIR /game-of-life
RUN mvn package


FROM tomcat:8
LABEL owner ="rakeshdasara"
EXPOSE 8080
COPY --from=builder game-of-life/gameoflife-web/target/gameoflife.war  /usr/local/tomcat/webapps/gameoflife.war    
CMD ["catalina.sh","run"] 

