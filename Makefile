.DEFAULT_GOAL := help

# target: help - Display available recipes.
.PHONY: help
help:
	@egrep "^# target:" [Mm]akefile

# target: lint-yaml - Lint the YAML files.
.PHONY: lint-yaml
lint-yaml:
	@yamllint .
