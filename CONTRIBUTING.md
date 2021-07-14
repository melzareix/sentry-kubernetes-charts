# Contributing Guidelines

Contributions are welcome via GitHub Pull Requests. This document outlines the process to help get your contribution accepted.

Any type of contribution is welcome; from bug fixes, documentation improvements or even [adding charts to the repository](#adding-a-new-chart-to-the-repository).

## How to Contribute

1. Fork this repository, develop, and test your changes.
2. Submit a pull request.

***NOTE***: To make the Pull Requests' (PRs) testing and merging process easier, please submit changes to multiple charts in separate PRs.

### Technical Requirements

When submitting a PR make sure that it:
- Must follow [Helm best practices](https://helm.sh/docs/chart_best_practices/).
- Any change to a chart requires a version bump following [semver](https://semver.org/) principles.
- Has [conventional commits](https://www.conventionalcommits.org/en/v1.0.0-beta.4/) to allow for automatic CHANGELOG generation.

### Documentation Requirements

- A chart's `README.md` must include configuration options.
- A chart's `NOTES.txt` must include relevant post-installation information.
- A chart should have a `values.cloudmobility.yaml` file if predefined properties from the `values.yaml` file are not to be presented in cloudmobility portal.
- The title of the PR starts with chart name (e.g. `[cloudmobility/chart]`)

### PR Approval and Release Process

1. Changes are manually reviewed by cloudmobility team.
2. Once the changes are accepted, the PR is tested, the chart is installed and tested on top of k8s platform.
3. When the PR is approved, it is merged by the reviewer(s) in the GitHub `master` branch.
4. Then our CD system is going to push the chart to the Helm registry.

***NOTE***: Please note that, in terms of time, may be a slight difference between the appearance of the code in GitHub and the chart in the registry.

### Adding a new chart to the repository

There are only two major requirements to add a new chart in our catalog:
- Follow the same structure/patterns that the rest of the cloudmobility charts.
- Use an [OSI approved license](https://opensource.org/licenses) for all the software.
