.PHONY: all up down setup clean fclean
all: setup up

up:
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down

setup:
	@mkdir -p ${HOME}/data/maria-db
	@mkdir -p ${HOME}/data/wordpress-db

clean:
	@docker compose -f srcs/docker-compose.yml down --volumes
	@rm -rf ${HOME}/data

fclean:
	@docker stop $$(docker ps -qa); \
	docker rm $$(docker ps -qa); \
	docker rmi -f $$(docker images -qa); \
	docker volume rm $$(docker volume ls -q); \
	docker network rm $$(docker network ls -q);
