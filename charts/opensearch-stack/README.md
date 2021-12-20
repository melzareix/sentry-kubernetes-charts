# OpenSearch

![opensearch-chart-badge](https://img.shields.io/badge/OpenSearch%20Chart-1.0.0-green?style=flat-square&logo=helm)
![fluentd-version-badge](https://img.shields.io/badge/Fluentd%20Version-1.12.4-green?style=flat-square&logo=fluentd)
![opensearch-version-badge](https://img.shields.io/badge/OpenSearch%20Version-1.2.1-green?style=flat-square)
![opensearch-dashboards-version-badge](https://img.shields.io/badge/OpenSearchDashboards%20Version-1.1.0-green?style=flat-square)
---

[OpenSearch](https://opensearch.org/) is an open source search and analytics suite, besides the opensearch components, this stack includes a [fluentd](https://github.com/fluent/helm-charts) installation that will agregate the logs that will be forwarded into opensearch.

## Table of Contents

- [OpenSearch](#opensearch)
  - [!opensearch-dashboards-version-badge](#)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Installing the Chart](#installing-the-chart)
  - [Uninstalling the Chart](#uninstalling-the-chart)
  - [Configuration](#configuration)
    - [Parameters](#parameters)
    - [Deployment parameters](#deployment-parameters)
    - [Persistence parameters](#persistence-parameters)
    - [Exposure parameters](#exposure-parameters)
    - [Metrics parameters](#metrics-parameters)

## Introduction

This chart deploys a OpenSearch Stack and a fluentd on a [Kubernetes](http://kubernetes.io) cluster using
[Helm](https://helm.sh).

cloudmobility charts are tailored charts that contain adjustments to the configuration, allowing you a one-click deployment experience in our [platform](https://portal.cloudmobility.io/).

> **Tip**: We recommend using and configuring this chart with a continuous delivery strategy.

## Installing the Chart

```console
$ helm repo add cloudmobility https://cloudmobility.github.io/charts
$ helm install cmy-opensearch cloudmobility/opensearch-stack --namespace my-namespace
```

You can change the configuration for the grafana deployment in the Config Section.

## Uninstalling the Chart

Since we are using helm you can use the delete command in order to uninstall/delete the installation that was deployed
with the previous commands:

```console
$ helm delete cmy-opensearch
```

## Configuration

Since this chart have the following dependencies:

* [fluentd](https://github.com/fluent/helm-charts/tree/main/charts/fluentd)
* [opensearch](https://github.com/opensearch-project/helm-charts/tree/main/charts/opensearch)
* [opensearch-dashboards](https://github.com/opensearch-project/helm-charts/tree/main/charts/opensearch-dashboards)

You can use all the configuration provided by that chart. In order to do so, be sure to prepend all the
configuration with the respective dependency(**fluentd**/**opensearch**/**opensearch-dashboards**).

The configuration of this chart can be exhaustive. In order to minimize the configuration the following list will show
the parameters that we think that may be important for you. If you want to have access to the full configuration of the
chart please have a look on those links:

* [fluentd](https://github.com/fluent/helm-charts/blob/main/charts/fluentd/values.yaml)
* [opensearch](https://github.com/opensearch-project/helm-charts/blob/main/charts/opensearch/README.md#configuration)
* [opensearch-dashboards](https://github.com/opensearch-project/helm-charts/blob/main/charts/opensearch-dashboards/values.yaml)

### Parameters

| Parameter                                | Description                                                                   | Default |
| ---------------------------------------- | ----------------------------------------------------------------------------- | ------- |
| `fluentd.nameOverride`                   | String to partially override fluentd.fullname                                 | `nil`   |
| `fluentd.fullnameOverride`               | String to fully override fluentd.fullname                                     | `nil`   |
| `opensearch.nameOverride`                | String to partially override opensearch.fullname                              | `nil`   |
| `opensearch.fullnameOverride`            | String to fully override opensearch.fullname                                  | `nil`   |
| `opensearch-dashboards.nameOverride`     | String to partially override opensearch-dashboards.fullname                   | `nil`   |
| `opensearch-dashboards.fullnameOverride` | String to fully override opensearch-dashboards.fullname                       | `nil`   |
| `opensearch.users.dashboard.user`        | Opensearch user (required)                                                    | `nil`   |
| `opensearch.users.dashboard.password`    | Opensearch password that will be encrypted with bcrypt on template (required) | `nil`   |
| `opensearch.users.logging.user`          | Fluentd user that will communicate with elastic search (required)             | `nil`   |
| `opensearch.users.logging.password`      | Fluentd password that will be encrypted with bcrypt on template  (required)   | `nil`   |


### Deployment parameters

| Parameter                                  | Description                                                  | Default                        |
| ------------------------------------------ | ------------------------------------------------------------ | ------------------------------ |
| `fluentd.replicaCount`                     | Number of FluentD nodes                                      | `1`                            |
| `fluentd.updateStrategy`                   | Update strategy for the deployment                           | `{type: "RollingUpdate"}`      |
| `fluentd.podLabels`                        | FluentD pod labels                                           | `{}` (evaluated as a template) |
| `fluentd.podAnnotations`                   | FluentD Pod annotations                                      | `{}` (evaluated as a template) |
| `fluentd.livenessProbe`                    | Liveness probe configuration for FluentD                     | `Check values.yaml file`       |
| `fluentd.readinessProbe`                   | Readiness probe configuration for FluentD                    | `Check values.yaml file`       |
| `fluentd.resources.limits`                 | The resources limits for FluentD containers                  | `{}`                           |
| `fluentd.resources.requests`               | The requested resources for FluentD containers               | `{}`                           |
| `opensearch.replicaCount`                  | Number of OpenSearch nodes                                   | `1`                            |
| `opensearch.updateStrategy`                | Update strategy for the deployment                           | `{type: "RollingUpdate"}`      |
| `opensearch.podLabels`                     | OpenSearch pod labels                                        | `{}` (evaluated as a template) |
| `opensearch.podAnnotations`                | OpenSearch Pod annotations                                   | `{}` (evaluated as a template) |
| `opensearch.livenessProbe`                 | Liveness probe configuration for OpenSearch                  | `Check values.yaml file`       |
| `opensearch.readinessProbe`                | Readiness probe configuration for OpenSearch                 | `Check values.yaml file`       |
| `opensearch.resources.limits`              | The resources limits for OpenSearch containers               | `{}`                           |
| `opensearch.resources.requests`            | The requested resources for OpenSearch containers            | `{}`                           |
| `opensearch-dashboards.replicaCount`       | Number of opensearch-dashboards nodes                        | `1`                            |
| `opensearch-dashboards.updateStrategy`     | Update strategy for the deployment                           | `{type: "RollingUpdate"}`      |
| `opensearch-dashboards.podLabels`          | opensearch-dashboards pod labels                             | `{}` (evaluated as a template) |
| `opensearch-dashboards.podAnnotations`     | opensearch-dashboards Pod annotations                        | `{}` (evaluated as a template) |
| `opensearch-dashboards.livenessProbe`      | Liveness probe configuration for opensearch-dashboards       | `Check values.yaml file`       |
| `opensearch-dashboards.readinessProbe`     | Readiness probe configuration for opensearch-dashboards      | `Check values.yaml file`       |
| `opensearch-dashboards.resources.limits`   | The resources limits for opensearch-dashboards containers    | `{}`                           |
| `opensearch-dashboards.resources.requests` | The requested resources for opensearch-dashboards containers | `{}`                           |

### Persistence parameters

| Parameter                                        | Description                                             | Default         |
| ------------------------------------------------ | ------------------------------------------------------- | --------------- |
| `fluentd.persistence.enabled`                    | Enable persistence for the Fluentd                      | `true`          |
| `fluentd.persistence.storageClass`               | Storage class to use with the Fluentd PVC               | `nil`           |
| `fluentd.persistence.accessMode`                 | Access mode to the Fluentd PV                           | `ReadWriteOnce` |
| `fluentd.persistence.size`                       | Size for the Fluentd PV                                 | `5Gi`           |
| `opensearch.persistence.enabled`                 | Enable persistence for OpenSearch                       | `true`          |
| `opensearch.persistence.storageClass`            | Storage class to use with the OpenSearch PVC            | `nil`           |
| `opensearch.persistence.accessMode`              | Access mode to the OpenSearch PV                        | `ReadWriteOnce` |
| `opensearch.persistence.size`                    | Size for the OpenSearch PV                              | `5Gi`           |
| `opensearch-dashboards.persistence.enabled`      | Enable persistence for OpenSearch-dashboards            | `true`          |
| `opensearch-dashboards.persistence.storageClass` | Storage class to use with the OpenSearch-dashboards PVC | `nil`           |
| `opensearch-dashboards.persistence.accessMode`   | Access mode to the OpenSearch-dashboards PV             | `ReadWriteOnce` |
| `opensearch-dashboards.persistence.size`         | Size for the OpenSearch-dashboards PV                   | `5Gi`           |

### Exposure parameters

In order to give a better experience regarding ingresses and tls we are allowing the users to use the cmy-shared ingress
controller. If you don't know how it works we strongly suggest reading the
[documentation](https://portal.cloudmobility.io/docs/en/cns/shared-ingress-controller.html)
regarding this annotation and the features that it provides.
> **Note**: You can also use a [dedicated ingress controller](https://portal.cloudmobility.io/docs/en/cns/dedicated-ingress-controller.html)

| Parameter                       | Description                                                                            | Default                                                                                 |
| ------------------------------- | -------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------- |
| `ingress.enabled`               | Enable ingress controller resource                                                     | `true`                                                                                  |
| `ingress.hostname`              | Default host for the ingress resource. If specified as "*" no host rule is configured. | `<any-text>-<namespace>-<cluster-name>.cloud.eu1.cloudmobility.io`                      |
| `ingress.path`                  | Default path for the ingress resource                                                  | `/`                                                                                     |
| `ingress.tls`                   | Create TLS Secret                                                                      | `true`                                                                                  |
| `ingress.annotations`           | Ingress annotations                                                                    | `[kubernetes.io/ingress.class: cmy-shared, cloudmobility.io/generate-hostname: "true"]` |
| `ingress.spec.ingressClassName` | Ingress annotations                                                                    | `cmy-shared`                                                                            |

> **Note**: If you use the `cloudmobility.io/generate-hostname` your `ingress.hostname` value will be overwritten and tls will be enabled by default.

### Metrics parameters

| Parameter                                  | Description                                             | Default |
| ------------------------------------------ | ------------------------------------------------------- | ------- |
| `fluentd.metrics.prometheusRule.enabled`   | if `true`, creates a Prometheus Operator ServiceMonitor | `false` |
| `fluentd.metrics.prometheusRule.namespace` | Namespace in which Prometheus is running                | `nil`   |
