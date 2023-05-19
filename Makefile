up: build
	@docker compose up -d
	@docker exec -it ft_onion cat /var/lib/tor/web_hidden_service/hostname

build:
	@docker compose build

rebuild:
	@docker compose build --no-cache

stop:
	@docker compose stop

down:
	@docker compose down

clear:
	@docker compose down -v

.PHONY: up build rebuild stop down clear