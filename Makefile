.PHONY: all up down setup re clean iclean
all: setup up

up:
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker compose -f srcs/docker-compose.yml down --volumes

setup:
	@mkdir -p ${HOME}/data/maria-db
	@mkdir -p ${HOME}/data/wordpress-db

fclean: clean
	@rm -rf ${HOME}/data

iclean:
	@docker rmi `docker images -a -q`

