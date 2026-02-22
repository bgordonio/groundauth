# GroundAuth

An authentication server designed specifically for homelab environments. GroundAuth runs on a minimal VPS externally while protecting your self-hosted services at home - providing OIDC and SAML identity services for your homelab applications.

## Features

- **OIDC Authorization Server** - Full OpenID Connect provider implementation
- **SAML Identity Provider** - SAML 2.0 IDP for enterprise integrations
- **Multiple Authentication Methods**
  - Username/Password
  - OTP Authenticator App (TOTP)
  - Passkeys (WebAuthn/FIDO2)
  - Client Certificates (mTLS)
- **TLS Support** - Automatic Let's Encrypt certificates or custom certificates
- **Customizable UI** - Template-based UI for easy theming

## Target Environment

Optimized for resource-constrained VPS:
- 512 MB RAM
- 1 CPU Core
- 30GB SSD
- 500GB monthly transfer at 1 Gbps

**Estimated Memory Usage**: ~80-120MB

## Tech Stack

| Component | Technology |
|-----------|------------|
| Language | Go (Golang) |
| Web Framework | Chi Router |
| Database | SQLite |
| OIDC | go-oidc |
| SAML | go-saml |
| TLS/ACME | CertMagic |

## Administration

GroundAuth supports multiple management interfaces:

- **Web-based Admin UI** - Manage users, clients, and settings via browser
- **CLI Tool** - Command-line management for power users
- **Configuration Files** - YAML-based configuration

## Getting Started

*(Documentation coming soon)*

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
│   └── static/             # Static assets
├── migrations/             # Database migrations
├── go.mod                  # Go module definition
└── go.sum                  # Go dependencies
```

## License

MIT
