# Makefile of ansible_pakiti_client role

lint-yaml: ## lint yaml files
	yamllint -c .yamllint.yml .
.PHONY: lint-yaml

lint-ansible: ## lint yaml files
	ansible-lint -c .ansible-lint .
.PHONY: lint-ansible

lint: | lint-yaml lint-ansible

help:
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
.PHONY: help
