# Grafana

![grafana-chart-badge](https://img.shields.io/badge/Grafana%20Chart-1.0.0-green?style=flat-square&logo=helm)
![grafana-version-badge](https://img.shields.io/badge/Grafana%20Version-8.0.4-green?style=flat-square&logo=grafana)
![bitnami-charts](https://img.shields.io/badge/bitnami-charts-1598CB)
---

[Grafana](https://grafana.com/) is an open source, feature rich metrics dashboard and graph editor for Graphite,
Elasticsearch, OpenTSDB, Prometheus and InfluxDB(TM).

## Table of Contents

* [Introduction](#introduction)
* [Installing](#installing-the-chart)
* [Uninstalling](#uninstalling-the-chart)
* [Configuration](#configuration)
    * [Parameters](#parameters)
    * [Deployment parameters](#deployment-parameters)
    * [Persistence parameters](#persistence-parameters)
    * [Exposure parameters](#exposure-parameters)
    * [Metrics parameters](#metrics-parameters)

## Introduction

This chart deploys a Grafana on a [Kubernetes](http://kubernetes.io) cluster using
[Helm](https://helm.sh).

cloudmobility charts are tailored [bitnami](https://github.com/bitnami/charts/tree/master/bitnami) charts that contain adjustments to the configuration, allowing you a one-click deployment experience in our [platform](https://portal.cloudmobility.io/).

> **Tip**: We recommend using and configuring this chart with a continuous delivery strategy.

## Installing the Chart

```console
$ helm repo add cloudmobility https://cloudmobility.github.io/charts
$ helm install cmy-grafana cloudmobility/grafana --namespace my-namespace
```

You can change the configuration for the grafana deployment in the Config Section.

## Uninstalling the Chart

Since we are using helm you can use the delete command in order to uninstall/delete the installation that was deployed
with the previous commands:

```console
$ helm delete cmy-grafana
```

## Configuration

Since this chart has [bitnami/grafana](https://github.com/bitnami/charts/tree/master/bitnami/grafana) chart as
dependency you can use all the configuration provided by that chart. In order to do so, be sure to prepend all the
configuration with **grafana**.

The configuration of this chart can be exhaustive. In order to minimize the configuration the following list will show
the parameters that we think that may be important for you. If you want to have access to the full configuration of the
chart please have a look [here](https://github.com/bitnami/charts/tree/master/bitnami/grafana#parameters).

### Parameters

| Parameter          | Description                                                          | Default                        |
|--------------------|----------------------------------------------------------------------|--------------------------------|
| `nameOverride`     | String to partially override grafana.fullname                        | `nil`                          |
| `fullnameOverride` | String to fully override grafana.fullname                            | `nil`                          |
| `kubeVersion`      | Force target Kubernetes version (using Helm capabilities if not set) | `nil`                          |

| Parameter                                  | Description                                                                | Default                                                 |
|--------------------------------------------|----------------------------------------------------------------------------|---------------------------------------------------------|
| `grafana.image.pullPolicy`                 | Grafana image pull policy                                                  | `IfNotPresent`                                          |
| `grafana.image.pullSecrets`                | Specify docker-registry secret names as an array                           | `[]` (does not add image pull secrets to deployed pods) |
| `grafana.admin.user`                       | Grafana admin username                                                     | `admin`                                                 |
| `grafana.admin.password`                   | Grafana admin password                                                     | Randomly generated                                      |
| `grafana.smtp.enabled`                     | Enable SMTP configuration                                                  | `false`                                                 |
| `grafana.smtp.host`                        | SMTP host                                                                  | `nil`                                                   |
| `grafana.smtp.user`                        | SMTP user                                                                  | `user`                                                  |
| `grafana.smtp.password`                    | SMTP password                                                              | `password`                                              |
| `grafana.plugins`                          | Grafana plugins to be installed in deployment time separated by commas     | `nil`                                                   |
| `grafana.extraEnvVars`                     | Array containing extra env vars to configure Grafana                       | `{}`                                                    |

### Deployment parameters

| Parameter                              | Description                                                                               | Default                        |
|----------------------------------------|-------------------------------------------------------------------------------------------|--------------------------------|
| `grafana.replicaCount`                 | Number of Grafana nodes                                                                   | `1`                            |
| `grafana.updateStrategy`               | Update strategy for the deployment                                                        | `{type: "RollingUpdate"}`      |
| `grafana.podLabels`                    | Grafana pod labels                                                                        | `{}` (evaluated as a template) |
| `grafana.podAnnotations`               | Grafana Pod annotations                                                                   | `{}` (evaluated as a template) |
| `grafana.livenessProbe`                | Liveness probe configuration for Grafana                                                  | `Check values.yaml file`       |
| `grafana.readinessProbe`               | Readiness probe configuration for Grafana                                                 | `Check values.yaml file`       |
| `grafana.resources.limits`             | The resources limits for Grafana containers                                               | `{}`                           |
| `grafana.resources.requests`           | The requested resources for Grafana containers                                            | `{}`                           |

### Persistence parameters

| Parameter                          | Description                       | Default         |
|------------------------------------|-----------------------------------|-----------------|
| `grafana.persistence.enabled`      | Enable persistence                | `true`          |
| `grafana.persistence.storageClass` | Storage class to use with the PVC | `nil`           |
| `grafana.persistence.accessMode`   | Access mode to the PV             | `ReadWriteOnce` |
| `grafana.persistence.size`         | Size for the PV                   | `5Gi`           |

### Exposure parameters

In order to give a better experience regarding ingresses and tls we are allowing the users to use the cmy-shared ingress
controller. If you don't know how it works we strongly suggest reading the
[documentation](https://portal.cloudmobility.io/docs/en/cns/shared-ingress-controller.html)
regarding this annotation and the features that it provides.
> **Note**: You can also use a [dedicated ingress controller](https://portal.cloudmobility.io/docs/en/cns/dedicated-ingress-controller.html)

| Parameter                                  | Description                                                                            | Default                                                             |
|--------------------------------------------|----------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| `grafana.ingress.enabled`                  | Enable ingress controller resource                                                     | `true`                                                              |
| `grafana.ingress.hostname`                 | Default host for the ingress resource. If specified as "*" no host rule is configured. | `<any-text>-<namespace>-<cluster-name>.cloud.eu1.cloudmobility.io`  |
| `grafana.ingress.path`                     | Default path for the ingress resource                                                  | `/`                                                                 |
| `grafana.ingress.tls`                      | Create TLS Secret                                                                      | `true`                                                              |
| `grafana.ingress.annotations`              | Ingress annotations                                                                    | `[kubernetes.io/ingress.class: cmy-shared]`                         |

### Metrics parameters

| Parameter                                      | Description                                                                                            | Default                                   |
|------------------------------------------------|--------------------------------------------------------------------------------------------------------|-------------------------------------------|
| `grafana.metrics.enabled`                      | Enable the export of Prometheus metrics                                                                | `false`                                   |
| `grafana.metrics.service.annotations`          | Annotations for Prometheus metrics service                                                             | `Check values.yaml file`                  |
| `grafana.metrics.serviceMonitor.enabled`       | if `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) | `false`                                   |
| `grafana.metrics.serviceMonitor.namespace`     | Namespace in which Prometheus is running                                                               | `nil`                                     |
| `grafana.metrics.serviceMonitor.interval`      | Interval at which metrics should be scraped.                                                           | `nil` (Prometheus Operator default value) |
| `grafana.metrics.serviceMonitor.scrapeTimeout` | Timeout after which the scrape is ended                                                                | `nil` (Prometheus Operator default value) |
| `grafana.metrics.serviceMonitor.selector`      | Prometheus instance selector labels                                                                    | `nil`                                     |
