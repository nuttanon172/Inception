.PHONY: all up down clean fclean setup
all: setup up

up:
	@docker-compose -f srcs/docker-compose.yml up -d

down:
	@docker-compose -f srcs/docker-compose.yml down -d

clean:
	@docker compose -f srcs/docker-compose.yml down --volumes

setup:
	@mkdir -p ${HOME}/database/maria-db
	@mkdir -p ${HOME}/database/wordpress-db

fclean: clean
	@rm -rf ${HOME}/database
