# Nke.Tools.Jekyll 
![GTHB Workflow Status](https://img.shields.io/github/workflow/status/bluekrow-dockerhub/nke.tools.jekyll/Auto-Versioning?label=Auto%20Version&logo=github&logoColor=gainsboro)
![DCKR Cloud Build Status](https://img.shields.io/docker/cloud/build/bluekrow/nke-tools-jekyll?label=Auto%20Build&logo=docker&logoColor=gainsboro)
![GTHB Last Commit](https://img.shields.io/github/last-commit/bluekrow-dockerhub/nke.tools.jekyll?label=Last%20Commit&logo=github&logoColor=gainsboro)
![GTHB Latest Tag (by date)](https://img.shields.io/github/v/tag/bluekrow-dockerhub/nke.tools.jekyll?label=Latest%20Tag&logo=github&logoColor=gainsboro)

Customized Jekyll Image to test a Jekyll site locally

## Docker Image
Using a docker container image composed using
- Ubuntu Eoan 
- All of this defined here [nke-tools-jekyll](https://hub.docker.com/repository/docker/bluekrow/nke-tools-jekyll)

## Automation
### Auto Versioning
Using GitHub Actions for auto tagging, only when pushing commits to master  
**Next Step**: would be auto semantic versioning. Issue #1 has been created for this purpose.
### Auto Build
Using DockerHub automatic builds, to build the following **identical** docker tags when a tag is created on GitHub repository master branch:
- Latest
- \<major>
- \<major>.\<minor>
- \<major>.\<minor>.\<builtAtDay>.\<builtAtSecond>
### Auto Test 
Using DockerHub automatic testing with a System Under Test (SUT) service after every build and before every push to the DockerHub registry.

## End User Guide
The following script can be executed in the root of our jekyll site project:
```
docker run \
    --name <container-name> \
    --rm -it \
    -v "$PWD":/jkl-site \
    -p <host-port>:4000 \
    bluekrow:nke-tools-jekyll:1.2 \
    <jekyll-instruction>
```
Where:
- `-v` parameter is used to bind directories, in this case:
  - `$PWD` is an environment var storing the current path in the host
  - `/jkl-site` is the working directory path on the container, where jekyll will be executed
- `-p` parameter is used to bind ports, in this case:
  - `<host-port>` is the host port
  - `4000` is the default jekyll port in the container
- `<jekyll-instruction>` can be one of the following:
  - jkl-new
  - jkl-build
  - jkl-serve
