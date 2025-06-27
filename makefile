#Valiables
GO = go
PROJECT_DIR = $(shell pwd)
GQLGEN = github.com/99designs/gqlgen

# Environment
PORT = 8080


build:
	@echo "(1/2) Building the server..."
	@$(GO) build -o $(PROJECT_DIR)/bin/server $(PROJECT_DIR)/server.go
	@echo "(2/2) Server built into: $(PROJECT_DIR)/bin/server"

run: build
	@echo "(1/1) Running the server..."
	@PORT=$(PORT) $(PROJECT_DIR)/bin/server.go

generate:
	@echo "(1/2) Generating GraphQL Schema..."
	@$(GO) run $(GQLGEN) generate
	@echo "(2/2) GraphQL Schema generated successfully."

clean:
	@echo "(1/2)Cleaning up build artifacts..."
	@rm -f $(PROJECT_DIR)/bin
	@echo "(2/2) $(PROJECT_DIR)/bin Cleanup complete."

.DEFAULT_GOAL := run