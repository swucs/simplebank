postgres:
	docker run -p 5432:5432 --name postgres -e POSTGRES_PASSWORD=1q2w3e4r -d -v ~/volume/postgresql:/var/lib/postgresql/data postgres

createdb:
	docker exec -it postgres createdb --username=postgres --owner=postgres simple_bank

dropdb:
	docker exec -it postgres dropdb --username=postgres simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://postgres:1q2w3e4r@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://postgres:1q2w3e4r@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate


test:
	go test -v -cover ./...

.PHONY: postgres createdb dropdb migrateup migratedown sqlc test