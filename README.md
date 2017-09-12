# Jenkins Master

Automated build for a Jenkins image including plugins and seed job.
This project is inspired by Torben Knerr's [jenkins-pipes-infra](https://github.com/tknerr/jenkins-pipes-infra), which provides a more extensive documentation.

## Adding new jenkins plugins

To add new plugins just add it to `plugins.txt`

Caution: After the last plugin an empty line is needed, otherwise the last plugin will not be installed!

## Running the Container

    docker run -p 8080:8080 emnify/jenkins:latest

For further information, consult the documentation of the [jenkinsci/jenkins container](https://github.com/jenkinsci/docker/blob/master/README.md)

## Creating a new Container Version

To trigger a new build, create a tag (`<jenkinsVersion>-<iteration>`, e.g. `2.60.1-3` for our 3rd try with Jenkins 2.60.1).
The automated build at Docker Hub will then automatically process this.


