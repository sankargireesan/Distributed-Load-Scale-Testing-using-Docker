FROM  hauptmedia/java:oracle-java8

ENV  DEBIAN_FRONTEND noninteractive

ENV  JMETER_VERSION  4.0
ENV  JMETER_HOME /opt/apache-jmeter-${JMETER_VERSION}
ENV  JMETER_BIN  ${JMETER_HOME}/bin
ENV  JMETER_DOWNLOAD_URL  http://mirrors.ocf.berkeley.edu/apache/jmeter/binaries/apache-jmeter-${JMETER_VERSION}.tgz

# install needed debian packages & clean up
RUN  apt-get update && \
  apt-get install -y --no-install-recommends curl tar ca-certificates unzip && \
  apt-get clean autoclean && \
     apt-get autoremove --yes && \
     rm -rf /var/lib/{apt,dpkg,cache,log}/

# download and extract jmeter 
RUN  mkdir -p ${JMETER_HOME} && \
  curl -L --silent ${JMETER_DOWNLOAD_URL} | tar -xz --strip=1 -C ${JMETER_HOME} && \
  curl -L --silent http://jmeter-plugins.org/downloads/file/JMeterPlugins-Standard-1.2.1.zip -o /tmp/jmeter-plugins-standard.zip && \
  unzip -o -d /opt/jmeter/ /tmp/jmeter-plugins-standard.zip && \
  rm /tmp/jmeter-plugins-standard.zip

ADD jmeter.properties /opt/apache-jmeter-4.0/

COPY launch.sh /opt/apache-jmeter-4.0/launch.sh

ADD smp.jmx /opt/apache-jmeter-4.0/smp.jmx

WORKDIR  ${JMETER_HOME}