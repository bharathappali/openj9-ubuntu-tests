FROM bharathappali/openj9-jdk11-ubuntu

RUN apt-get update \
    && apt-get -y install make \
    ant \
    libtext-csv-perl \
    libxml-parser-perl \
    gdb \
    wget \
    curl \
    git

RUN mkdir -p /home/openj9-testspace; \
    cd /home/openj9-testspace; \
    git clone -b master https://github.com/eclipse/openj9.git; \
    TAR_URL="https://github.com/bharathappali/openj9-ubuntu-builds/raw/master/native-test-libs.tar.gz"; \
    curl -LfsSo /tmp/nativetestlibs.tar.gz ${TAR_URL}; \
    mkdir -p /opt/java/native-test-libs; \
    cd /opt/java/native-test-libs; \
    tar -xf /tmp/nativetestlibs.tar.gz --strip-components=1; \
    rm -f /tmp/nativetestlibs.tar.gz




ENV TEST_JDK_HOME=/opt/java/openjdk

ENV NATIVE_TEST_LIBS=/opt/java/native-test-libs/openj9

WORKDIR /home/openj9-testspace/openj9/test/TestConfig
