.PHONY: all up down clean setup re fclean
all: setup up

up:
	@docker-compose -f srcs/docker-compose.yml up -d --build

down:
	@docker-compose -f srcs/docker-compose.yml down

clean:
	@docker compose -f srcs/docker-compose.yml down --volumes

setup:
	@mkdir -p ${HOME}/database/maria-db
	@mkdir -p ${HOME}/database/wordpress-db

re: clean up

fclean: clean
	@sudo rm -rf ${HOME}/database/maria-db
	@sudo rm -rf ${HOME}/database/wordpress-db
