build:
	@docker compose up --build -d

up:
	@docker compose up -d

down:
	@docker compose down

bash:
	@docker compose exec django bash
rs:
	@docker compose restart
