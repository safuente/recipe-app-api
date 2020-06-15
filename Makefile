# Run unit tests
test:
	docker-compose run --rm app ./manage.py test

lint:
	docker-compose run --rm app flake8

