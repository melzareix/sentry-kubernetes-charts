# Cloudmobility charts

Cloudmobility tailored charts available as `applications` in our platform.

The charts are available through a normal helm repo at [cloudmobility.github.io/charts](https://cloudmobility.github.io/charts)

## Usage

You have two options when it comes to using our charts:
* As a cloudmobility application
* As a normal helm chart through [helm CLI](https://helm.sh/docs/intro/install/)

### 1. Cloudmobility applications

### 2. Helm CLI

1. `helm repo add cloudmobility https://cloudmobility.github.io/charts`
2. `helm search repo cloudmobility`
3. `helm install my-release cloudmobility/chart-name --namespace my-namespace`

## Deployment

This helm repo is deployed using github pages and is available at [cloudmobility.github.io/charts](https://cloudmobility.github.io/charts). 

The branch used as a mirror for production is [gh-pages](https://github.com/cloudmobility/charts/tree/gh-pages).

The `/charts` folder contains all the charts available in the helm repo. This folder is used as a source, in our CI/CD pipeline on GitHub Actions, for all the charts to be released.

The process goes as follows:
1. Push to master triggers GitHub actions pipeline;
2. Helm charts available in `/charts` folder are packaged using `helm package`;
3. Helm repository's `index.yaml` is updated (if any new versions/charts are available);
4. New packaged charts and the updated `index.yaml` are committed to the [gh-pages branch](https://github.com/cloudmobility/charts/tree/gh-pages);
5. GitHub's CDN is updated based on [gh-pages branch](https://github.com/cloudmobility/charts/tree/gh-pages);
6. Charts are available at [cloudmobility.github.io/charts](https://cloudmobility.github.io/charts).