# helm-kubernetes-iam Docker hub image

[![](https://images.microbadger.com/badges/image/dtzar/helm-kubectl.svg)](https://microbadger.com/images/dtzar/helm-kubectl "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/dtzar/helm-kubectl.svg)](https://microbadger.com/images/dtzar/helm-kubectl "Get your own version badge on microbadger.com")
[![Build Status](https://travis-ci.org/dtzar/helm-kubectl.svg?branch=master)](https://travis-ci.org/dtzar/helm-kubectl)
[![Docker Stars](https://img.shields.io/docker/stars/dtzar/helm-kubectl.svg?style=flat)](https://hub.docker.com/r/dtzar/helm-kubectl/)
[![Docker Automated build](https://img.shields.io/docker/automated/dtzar/helm-kubectl.svg?style=flat)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/dtzar/helm-kubectl.svg)]()

## Overview

This image is based on excellent dtzar/helm-kubectl, this lightweight alpine docker image provides kubectl and helm binaries for working with a Kubernetes cluster.  A local configured kubectl is a prerequisite to use helm per [helm documentation](https://github.com/kubernetes/helm/blob/master/docs/quickstart.md).  This image is useful for general helm administration such as deploying helm charts and managing releases. It is also perfect for any automated deployment pipeline needing to use helm which supports docker images such as [Concourse CI](https://concourse.ci), [Jenkins on Kubernetes](https://kubeapps.com/charts/stable/jenkins), [Travis CI](https://docs.travis-ci.com/user/docker/), and [Circle CI](https://circleci.com/integrations/docker/).  Having bash installed allows for better support for troubleshooting by being able to exec / terminal in and run desired shell scripts.  Git installed allows installation of [helm plugins](https://github.com/kubernetes/helm/blob/master/docs/plugins.md).

If it is desired to only use kubectl and have kubectl as the entry command (versus this image as bash entry command), I recommend checking out this image instead:
[lachlanevenson/kubectl](https://hub.docker.com/r/lachlanevenson/k8s-kubectl/)

For authentication on AWS please read the documentation [for aws-iam-authenticator](https://docs.aws.amazon.com/eks/latest/userguide/configure-kubectl.html) and set the environment variables for use kubectl on Aws EKS service, read [here](https://docs.aws.amazon.com/sdk-for-go/v1/developer-guide/configuring-sdk.html#specifying-credentials) for more info.

## Run

Example to just run helm on entry:
`docker run --rm dtzar/helm-kubectl helm`
By default kubectl will try to use /root/.kube/config file for connection to the kubernetes cluster, but does not exist by default in the image.

Example for use with personal administration or troubleshooting with volume mount for kubeconfig files:
`docker run -it -v ~/.kube:/root/.kube dtzar/helm-kubectl`
The -v maps your host docker machine Kubernetes configuration directory (~/.kube) to the container's Kubernetes configuration directory (root/.kube).

## Build

For doing a manual local build of the image:
`make docker_build`

This image is now fully automated via travisci.org.
For reference this .travis.yml file can be validated via:
`docker run --rm -it -v yourclonedreporoot:/project caktux/travis-cli lint ./travis.yml`
