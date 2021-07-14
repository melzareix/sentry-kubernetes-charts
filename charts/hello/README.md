# Hello

![hello-chart-badge](https://img.shields.io/badge/Hello%20Chart-1.0.0-green?style=flat-square&logo=mercedes)
---

Hello is a chart that allow cloudmobility to easily proof the concept of applications inside the cloudmobility
infrastructure. This chart not meant to be use for production systems since it's just a proof of concept.

## Table of Contents

* [Introduction](#introduction)
* [Installing](#installing-the-chart)
* [Uninstalling](#uninstalling-the-chart)
* [Configuration](#configuration)
    * [Parameters](#parameters)
    * [Autoscaling parameters](#autoscaling-parameters)
    * [Resources parameters](#resources-parameters)
    * [Exposure parameters](#exposure-parameters)

## Introduction

This chart deploys a chat application on a [Kubernetes](http://kubernetes.io) cluster using
[Helm](https://helm.sh).

This chart, unlike the other ones, doesn't extends [bitnami](https://github.com/bitnami/charts/tree/master/bitnami)
charts. All the templates for this chart are available under the [templates folder](./templates). Also, this chart also
allows to proof the concept of one-click deployment in our [platform](https://portal.cloudmobility.io/).

> **Tip**: We recommend using and configuring this chart with a continuous delivery strategy.

## Installing the Chart

```console
$ helm repo add cloudmobility https://cloudmobility.github.io/charts
$ helm install cmy-hello cloudmobility/hello --namespace my-namespace
```

You can see the configuration available for the hello chart deployment in the [Configuration Section](#configuration).

## Uninstalling the Chart

Since we are using helm you can use the delete command in order to uninstall/delete the installation that was deployed
with the previous commands:

```console
$ helm delete cmy-hello
```

## Configuration

The configuration of this chart is not meant to exhaustive and all the available options will be listed bellow.

### Parameters

| Parameter          | Description                                                          | Default                        |
|--------------------|----------------------------------------------------------------------|--------------------------------|
| `nameOverride`     | String to partially override fullname                        | `nil`                          |
| `fullnameOverride` | String to fully override fullname                            | `nil`                          |

| Parameter                                  | Description                                                 | Default                                                 |
|--------------------------------------------|-------------------------------------------------------------|---------------------------------------------------------|
| `image.repository`                         | Hello image registry                                        | `cloudmobility/hello-world`                             |
| `image.tag`                                | Hello image tag (immutable tags are recommended)            | `1.0.0`                                                 |
| `image.pullPolicy`                         | Hello image pull policy                                     | `IfNotPresent`                                          |
| `image.pullSecrets`                        | Specify docker-registry secret names as an array            | `[]` (does not add image pull secrets to deployed pods) |

### Autoscaling parameters

| Parameter                                        | Description                                                                               | Default   |
|--------------------------------------------------|-------------------------------------------------------------------------------------------|-----------|
| `autoscaling.enabled`                            | Enable autoscalling                                                                       | `true`    |
| `autoscaling.minReplicas`                        | Sets the value for the min replicas                                                       | `1`       |
| `autoscaling.maxReplicas`                        | Sets the value for the max replicas                                                       | `1`       |
| `autoscaling.targetCPUUtilizationPercentage`     | Sets the utilization percentage CPU for autoscale                                         | `30`      |
| `autoscaling.targetMemoryUtilizationPercentage`  | Sets the utilization percentage Memory for autoscale                                      | `30`      |

### Resources parameters

| Parameter                      | Description                                   | Default   |
|--------------------------------|-----------------------------------------------|-----------|
| `resources.requests.cpu`       | The requested cpu for Hello containers        | `125m`    |
| `resources.requests.memory`    | The requested memory for Hello containers     | `128Mi`   |
| `resources.limits.cpu`         | The cpu limit for Hello containers            | `250m`    |
| `resources.limits.memory`      | The memory limit for Hello containers         | `256Mi`   |

### Exposure parameters

In order to give a better experience regarding ingresses and tls we are allowing the users to use the cmy-shared ingress
controller. If you don't know how it works we strongly suggest reading the
[documentation](https://portal.cloudmobility.io/docs/en/cns/shared-ingress-controller.html)
regarding this annotation and the features that it provides.
> **Note**: You can also use a [dedicated ingress controller](https://portal.cloudmobility.io/docs/en/cns/dedicated-ingress-controller.html)

| Parameter                                   | Description                                                                              | Default                                                                                  |
|---------------------------------------------|------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------|
| `ingress.enabled`                           | Enable ingress controller resource                                                       | `true`                                                                                   |
| `ingress.hosts.*.host`                      | Default host for the ingress resource.                                                   | `<any-text>-<namespace>-<cluster-name>.cloud.eu1.cloudmobility.io`                       |
| `ingress.tls.*.hosts.*`                     | Default tls for the ingress resource.                                                    | `<any-text>-<namespace>-<cluster-name>.cloud.eu1.cloudmobility.io`                       |
| `ingress.annotations`                       | Ingress annotations                                                                      | `[kubernetes.io/ingress.class: cmy-shared, cloudmobility.io/generate-hostname: "true"]`  |
| `service.type`                              | Kubernetes Service type                                                                  | `ClusterIP`                                                                              |
| `service.port`                              | Hello service port                                                                       | `80`                                                                                     |

> **Note**: If you use the `cloudmobility.io/generate-hostname` your `ingress.hostname` value will be overwritten and tls will be enabled by default.
