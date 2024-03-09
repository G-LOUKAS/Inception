Name = Inception

# Directories
SRCS		= ./srcs
COMPOSE		= $(SRCS)/docker-compose.yml

# Volumes
DATA		= /home/gloukas/data
WP			= $(DATA)/wordpress
DB			= $(DATA)/mariadb
# Commands
all: up

# Docker
build: create_v
	@docker-compose -f $(COMPOSE) build 
	@echo " $(BUILD)"
up: build
	@docker-compose -f $(COMPOSE) up -d
	@echo " $(UP)"
down:
	@docker-compose -f $(COMPOSE) down
	@echo " $(DOWN)"
create_v:
	@mkdir -p $(WP)
	@mkdir -p $(DB)
	@echo " $(CREATE_V)"
re: down up

fclean: down
	@sudo rm -rf $(DATA)
	@docker system prune -af

# Colors
RED			= \033[0;31m
GREEN		= \033[0;32m
RESET		= \033[0m

# Messages
MARK		= $(GREEN)✔	$(RESET)
BUILT		= $(GREEN)Built.$(RESET)
STOPPED		= $(RED)Stopped.$(RESET)
EXECUTED	= $(GREEN)Executed.$(RESET)
CREATED		= $(GREEN)Created.$(RESET)

# Rules
BUILD		= $(MARK)$(NAME)	$(BUILT)
UP			= $(MARK)$(NAME)	$(EXECUTED)
DOWN		= $(MARK)$(NAME)	$(STOPPED)
CREATE_V	= $(MARK)Volumes	$(CREATED)
