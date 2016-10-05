FROM pidy/android-sdk-docker:latest
MAINTAINER Giuseppe Buzzanca <giuseppebuzzanca@gmail.com>

#Update the system
RUN apt-get update && apt-get -y dist-upgrade

#Add required software
RUN apt-get -y install python

# Add the Cloud SDK
ADD https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-129.0.0-linux-x86_64.tar.gz .
RUN tar xzf google-cloud-sdk-129.0.0-linux-x86_64.tar.gz -C /opt

# Install the Cloud SDK
RUN echo y | /opt/google-cloud-sdk/install.sh

# Run gcloud init to get started
RUN echo y | /opt/google-cloud-sdk/bin/gcloud components install beta

# Clean up
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    rm -f google-cloud-sdk-129.0.0-linux-x86_64.tar.gz && \
    apt-get autoremove -y && \
    apt-get clean
