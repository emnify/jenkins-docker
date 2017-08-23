FROM jenkinsci/jenkins:2.60.3

# skip the setup wizard
ENV JAVA_ARGS -Djenkins.install.runSetupWizard=false

# create the seed job which spawns all other jobs
RUN mkdir -p /usr/share/jenkins/ref/jobs/seed-job
COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml


# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

