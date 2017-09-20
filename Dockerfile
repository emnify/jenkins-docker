FROM jenkinsci/jenkins:2.73.1

# skip the setup wizard
ENV JAVA_ARGS -Djenkins.install.runSetupWizard=false

# create the seed job which spawns all other jobs
RUN mkdir -p /usr/share/jenkins/ref/jobs/seed-job
COPY seedJob.xml /usr/share/jenkins/ref/jobs/seed-job/config.xml

# install fork of parallel-test-executor plugin
RUN mkdir -p /usr/share/jenkins/ref/plugins/ && wget https://github.com/StephenKing/parallel-test-executor-plugin/releases/download/1.10-SNAPSHOT-JENKINS-46028-primary-job-fallback-42d6e3b/parallel-test-executor.hpi -O /usr/share/jenkins/ref/plugins/parallel-test-executor.jpi

# install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

