# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gborne <gborne@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 20:06:48 by gborne            #+#    #+#              #
#    Updated: 2023/11/11 17:09:03 by gborne           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_DOCKER_COMPOSE = srcs/docker-compose.yml

all:
	./srcs/init.sh
	docker-compose -f $(PATH_DOCKER_COMPOSE) up -d --build

clean:
	docker-compose -f $(PATH_DOCKER_COMPOSE) stop
	docker-compose -f $(PATH_DOCKER_COMPOSE) down -v --remove-orphans

fclean: clean
	rm -rf /home/gborne/data
	docker system prune -af

re: fclean all

.PHONY: all clean fclean re
