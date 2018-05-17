# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash-oss:6.2.3

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

USER root
RUN curl -L -o /usr/share/java/postgresql-42.1.4.jar https://jdbc.postgresql.org/download/postgresql-42.1.4.jre6.jar
