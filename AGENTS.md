# GroundAuth - Project Specification

## Project Overview

**GroundAuth** is an authentication server designed for homelab environments. It runs on a minimal VPS externally while protecting self-hosted services at home - providing OIDC and SAML identity services for homelab applications.

## Purpose

GroundAuth provides OIDC and SAML authentication capabilities for homelab deployments, running efficiently on resource-constrained VPS environments (512MB RAM, 1 CPU).

## Target Environment

- **Hardware**: 512 MB RAM, 1 CPU Core, 30GB SSD
- **Network**: 500GB monthly transfer at 1 Gbps
- **OS**: Linux (Ubuntu LTS recommended)

## Requirements

### Core Features
- [x] OIDC Authorization Server
- [x] SAML Identity Provider (IDP)
- [x] Lightweight user database
- [x] TLS support with Let's Encrypt auto-certification
- [x] Custom TLS certificate support
- [x] Customizable UI templates

### Authentication Methods
- [x] Username/Password
- [x] OTP Authenticator App (TOTP)
- [x] Passkeys (WebAuthn/FIDO2)
- [x] Client Certificates (mTLS)

### Administration
- [x] Web-based Admin UI (manage users, clients, settings via browser)
- [x] CLI Tool (command-line management for power users)
- [x] Configuration Files (YAML-based config for server settings)

## Tech Stack

| Component | Technology | Rationale |
|-----------|------------|-----------|
| **Language** | Go (Golang) | Minimal memory footprint (~30MB runtime), single binary deployment, excellent security libraries |
| **Web Framework** | Chi Router | Lightweight, fast, net/http compatible |
| **Database** | SQLite | Zero configuration, file-based, minimal resource usage |
| **OIDC Provider** | go-oidc | Standards-compliant OpenID Connect implementation |
| **SAML IDP** | go-saml | Full SAML 2.0 support |
| **TLS/ACME** | CertMagic | Automatic Let's Encrypt certificate management |
| **UI Templates** | Go html/template | Built-in, secure templating engine |

## Estimated Resource Usage

- **Memory**: ~80-120MB (well under 512MB limit)
- **CPU**: Minimal - only during authentication requests
- **Storage**: ~50-100MB for binary + database

## Implementation Phases

### Phase 1: Core Infrastructure
- Project structure and Go module setup
- SQLite database schema (users, auth methods, sessions, clients)
- HTTP server with Chi router
- TLS support with CertMagic
- Configuration management

### Phase 2: User Management
- User CRUD operations
- Password authentication with bcrypt hashing
- User registration and login UI templates

### Phase 3: OIDC Authorization Server
- OAuth2/OIDC provider implementation
- JWT token generation and signing
- Client registration and management
- Scopes and claims handling
- Token refresh and revocation

### Phase 4: SAML Identity Provider
- SAML 2.0 Service Provider integration
- XML signing and encryption
- IDP metadata generation
- Attribute statements

### Phase 5: Multi-Factor Authentication
- TOTP (Time-based One-Time Password) - Google Authenticator compatible
- Passkeys via WebAuthn/FIDO2
- Client certificate authentication (mTLS)

### Phase 6: UI Customization
- Customizable HTML templates
- Theming support
- Internationalization ready

### Phase 7: Production Hardening
- Structured logging
- Monitoring and metrics
- Rate limiting
- Security hardening
- Backup and recovery

## Project Structure

```
groundauth/
├── cmd/
│   └── groundauth/          # Main application entry point
├── internal/
│   ├── config/              # Configuration management
│   ├── database/           # SQLite database layer
│   ├── handlers/           # HTTP handlers
│   ├── middleware/         # HTTP middleware
│   ├── models/             # Data models
│   ├── services/           # Business logic services
│   └── templates/          # HTML templates
├── web/
│   └── static/             # Static assets (CSS, JS, images)
├── migrations/             # Database migrations
├── go.mod                  # Go module definition
├── go.sum                  # Go dependencies
└── AGENTS.md              # This file
```

## Key Design Principles

1. **Minimal Resource Usage**: Must run efficiently on 512MB VPS
2. **Security First**: Proper password hashing, secure token generation, TLS by default
3. **Standards Compliance**: Full OIDC and SAML 2.0 compliance
4. **Customizable**: UI templates must be easily customizable
5. **Self-Contained**: Single binary deployment, minimal external dependencies

## Development Guidelines

- Use Go idioms and best practices
- All sensitive data must be hashed (bcrypt for passwords)
- TLS required for all production connections
- Comprehensive test coverage for authentication flows
- Follow OWASP security recommendations

## Git Workflow

### Branch Strategy

- `main` - Production-ready code, always deployable
- Feature branches - `feature/<description>` for new features
- Bugfix branches - `bugfix/<description>` for bug fixes
- Hotfix branches - `hotfix/<description>` for urgent production fixes

### Commit Messages

Follow Conventional Commits format:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

Types:
- `feat` - New feature
- `fix` - Bug fix
- `docs` - Documentation only
- `style` - Code style (formatting, no logic change)
- `refactor` - Code refactoring
- `test` - Adding or updating tests
- `chore` - Build, tooling, dependencies

### Workflow

1. Create feature branch from `main`
2. Make changes with clear, focused commits
3. Push branch and create pull request to `main`
4. Code review and testing
5. Merge to `main`

### Protected Branches

- `main` - Requires pull request, must pass tests

### Tags

Use semantic versioning tags for releases:
```
v1.0.0
v1.1.0
v1.0.1
```
