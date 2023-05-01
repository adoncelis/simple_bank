package api

import (
	db "github.com/adoncelis/simple_bank/db/sqlc"
)

type Server struct {
	store *db.Queries
}
