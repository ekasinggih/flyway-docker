FROM openjdk:8-jre

# setup ssh client
RUN apt-get update -y && apt-get install openssh-client -y

# download flyway
WORKDIR /flyway
ENV FLYWAY_VERSION 6.0.0-beta

RUN curl -L https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/${FLYWAY_VERSION}/flyway-commandline-${FLYWAY_VERSION}.tar.gz -o flyway-commandline-${FLYWAY_VERSION}.tar.gz \
  && tar -xzf flyway-commandline-${FLYWAY_VERSION}.tar.gz --strip-components=1 \
  && rm flyway-commandline-${FLYWAY_VERSION}.tar.gz

# setup tunnel
ADD run.sh /run.sh
RUN chmod +x /run.sh

ENV SSH_KEY null

CMD ["sh", "/run.sh"]