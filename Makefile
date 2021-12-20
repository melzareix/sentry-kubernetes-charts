.DEFAULT_GOAL := help

# target: help - Display available recipes.
.PHONY: help
help:
	@egrep "^# target:" [Mm]akefile
