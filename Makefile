.DEFAULT_GOAL := help

.PHONY: help
help: ## Help command
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n"} /^[$$()% a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-25s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: ci-add-helm-repos
ci-add-helm-repos: ## Add Helm neeeded repos for ci deploy
	@helm repo add bitnami https://charts.bitnami.com/bitnami && \
	helm repo add opensearch https://opensearch-project.github.io/helm-charts/ && \
    helm repo add fluentd https://fluent.github.io/helm-charts && \
	helm repo update

.PHONY: ci-lint-helm-charts
ci-lint-helm-charts: ## Lint Helm charts
	@helm lint --strict ./charts/grafana && \
	helm lint --strict ./charts/hello && \
	helm lint --strict -f ./charts/opensearch-stack/ci/ci-values.yml ./charts/opensearch-stack

.PHONY: ci-lint-install-depenedencies
ci-lint-install-depenedencies: ## Install helm chart dependencies
	@helm dependency update ./charts/grafana && \
	helm dependency update ./charts/hello && \
	helm dependency update ./charts/opensearch-stack

.PHONY: lint-charts
lint-charts: ci-add-helm-repos ci-lint-helm-charts ci-lint-install-depenedencies ## Lint Helm charts
