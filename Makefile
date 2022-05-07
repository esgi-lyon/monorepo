DETACHED:=$(DETACHED)

docker-full:
	@docker-compose -f docker-compose.yaml -f docker-compose.dev-tools.yaml up \
		$(if $(DETACHED), -d,)

docker:
	@docker-compose up $(if $(DETACHED), -d,)

docker-down:
	@docker-compose down --remove-orphans

postgre-seed:
	docker-compose exec -d postgres psql -f /docker-entrypoint-initdb.d/database-seed.sql

dev-auth:
	pnpm nx run-many --projects=auth-server,auth --target=serve

rebuild:
	@docker-compose down -v
	$(MAKE) docker DETACHED=true
