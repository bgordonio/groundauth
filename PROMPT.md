# GroundAuth - Project Setup Prompt

Begin implementing Phase 1: Core Infrastructure for the GroundAuth project.

## Project Overview

GroundAuth is an authentication server for homelab environments. It runs on a minimal VPS externally while protecting self-hosted services at home - providing OIDC and SAML identity services.

## Tech Stack

- Language: Go (Golang)
- Web Framework: Chi Router
- Database: SQLite
- TLS: CertMagic
- UI: Go html/template

## Target Environment

- 512 MB RAM, 1 CPU Core
- 30GB SSD
- 500GB monthly transfer at 1 Gbps

## Phase 1 Tasks

1. **Project Structure Setup**
   - Create directory structure per AGENTS.md:
     ```
     groundauth/
     ├── cmd/
     │   └── groundauth/
     ├── internal/
     │   ├── config/
     │   ├── database/
     │   ├── handlers/
     │   ├── middleware/
     │   ├── models/
     │   ├── services/
     │   └── templates/
     ├── web/
     │   └── static/
     └── migrations/
     ```

2. **Go Module Setup**
   - Initialize Go module: `go mod init github.com/groundauth/groundauth`
   - Add dependencies: chi, sqlite, certmagic, bcrypt

3. **Configuration Management**
   - Create YAML-based config in `internal/config/`
   - Support: server address, database path, TLS settings, Let's Encrypt settings

4. **SQLite Database**
   - Create schema for users, auth methods, sessions, clients
   - Use database/sql or a lightweight ORM

5. **HTTP Server with Chi**
   - Basic server setup in `cmd/groundauth/main.go`
   - Health check endpoint
   - Basic routing structure

6. **TLS Support**
   - Integrate CertMagic for Let's Encrypt
   - Support custom certificates

## Key Files to Create

- `cmd/groundauth/main.go` - Entry point
- `internal/config/config.go` - Configuration loading
- `internal/database/db.go` - Database connection and schema
- `internal/models/` - Data models
- `internal/handlers/` - HTTP handlers
- `internal/middleware/` - HTTP middleware

## Requirements

- All sensitive data must use bcrypt for password hashing
- TLS required for production
- Follow Go idioms and best practices
- Minimal resource usage (target: ~80-120MB RAM)

## Reference

See `AGENTS.md` for complete project specification and implementation phases.
