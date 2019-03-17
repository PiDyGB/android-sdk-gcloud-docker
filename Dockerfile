FROM pidy/android-sdk-docker:latest
MAINTAINER Giuseppe Buzzanca <giuseppebuzzanca@gmail.com>

#Update the system
RUN apt-get update && apt-get -y dist-upgrade

#Add required software
RUN apt-get -y install python

ENV GCLOUD_TAR=google-cloud-sdk-238.0.0-linux-x86_64.tar.gz

# Add the Cloud SDK
ADD https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${GCLOUD_TAR} /opt/
RUN tar xzf /opt/${GCLOUD_TAR} -C /opt

# Install the Cloud SDK
RUN echo y | /opt/google-cloud-sdk/install.sh

ENV PATH=/opt/google-cloud-sdk/bin:$PATH

# Clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f /opt/${GCLOUD_TAR} && \
    apt-get autoremove -y && \
    apt-get clean
