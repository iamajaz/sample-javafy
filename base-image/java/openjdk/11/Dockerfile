ARG openjdk_version=11.0.15
ARG dd_version=0.102.0

# Commentted line nothing else

FROM openjdk:${openjdk_version}-jdk-slim

# Refreshing ARGs lost after FROM statement
ARG dd_version

# Update base mage
RUN apt update;\
 apt install -y wget

# Downloading datadog java agent
RUN wget -O /opt/dd-java-agent.jar https://repo1.maven.org/maven2/com/datadoghq/dd-java-agent/${dd_version}/dd-java-agent-${dd_version}.jar

USER root

COPY ./base-image/java/openjdk/11/entrypoint.sh /entrypoint.sh
RUN chmod a+x /*.sh

ENTRYPOINT [ "/entrypoint.sh" ]
