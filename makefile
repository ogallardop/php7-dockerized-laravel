#init: 
help: ## This help.
	@echo "make [command]\n"
	@echo "Available commands:\n"
	@echo "init #Build the docker container"
	@echo "up #Start the docker container"
	@echo "cli #Connect into the docker container"

init: ## Build the container 
	@docker-compose build
	make up

up: ## Start all services
	@docker-compose up
	echo "Server is running at http://127.0.0.1"

cli:
	@docker-compose exec apache /bin/bash
