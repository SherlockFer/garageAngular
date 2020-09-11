#https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db

help: 
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

build: ## Build the images on local
	docker-compose build	--no-cache

up: ## Start containers on local
	docker-compose up --build  --force-recreate -d
	sleep 5
	docker-compose exec  -T api /bin/sh -c "rake db:reset && rake db:seed"

down: ## Stops containers on local
	docker-compose down

enter:
	 docker-compose exec api /bin/sh 
