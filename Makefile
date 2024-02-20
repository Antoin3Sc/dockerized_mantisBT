.PHONY: help
help:
	@echo "----------------------"
	@echo "--- Sandbox Helper ---"
	@echo "----------------------"
	@echo "Commands available"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-10s\033[37m %s\n", $$1, $$2}'
	@echo  "----------------------"


.PHONY: up
up: down ## Restart Sandbox
	@docker-compose up -d

.PHONY: down
down: ## Stop Sandbox
	@docker-compose down

.PHONY: logs
logs: ## Access Sandbox logs
	@docker-compose logs -f

.PHONY: bash
bash: ## Access Sandbox bash
	@docker-compose exec php-fpm bash

.PHONY: health
health: ## Check Sandbox status containers
	@docker-compose ps

.PHONY: build
build: ## Build Sandbox container
	@docker-compose build

.PHONY: init
init: ## Download Mantis Repository
	@cd src && git clone https://github.com/mantisbt/mantisbt.git . && composer install

