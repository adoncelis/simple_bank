dockerComposeUp:
	docker-compose up

createdb:
	docker exec -it simple_bank-db-1 createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it simple_bank-db-1 dropdb --username=postgres --owner=postgres simple_bank

migrateUp:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrateDown:
	migrate -path db/migration -database "postgres://postgres:postgres@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

.PHONY: dockerComposeUp createdb dropdb migrateUp migrateDown sqlc test