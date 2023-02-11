# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gborne <gborne@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/02/06 20:06:48 by gborne            #+#    #+#              #
#    Updated: 2023/02/11 16:02:15 by gborne           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

PATH_DOCKER_COMPOSE = srcs/docker-compose.yml

all:
	docker-compose -f $(PATH_DOCKER_COMPOSE) up --build

clean:
	docker-compose -f $(PATH_DOCKER_COMPOSE) stop
	docker-compose -f $(PATH_DOCKER_COMPOSE) down -v

fclean: clean
	docker system prune -af

re: fclean all

.PHONY: all clean fclean re
