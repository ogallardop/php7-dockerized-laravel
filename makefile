#init: 
help: ## This help.
	@echo "make [command]\n"
	@echo "Available commands:\n"
	@echo "init #Build the docker container"
	@echo "up #Start the docker container"
	@echo "cli #Connect into the docker container"

init: ## Build the container 
	@docker-compose build

up: ## Start all services
	@docker-compose up

cli:
	@docker-compose exec apache /bin/bash
