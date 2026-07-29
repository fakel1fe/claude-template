#!/bin/bash

set -e

echo "🚀 Project setup started"

echo ""
echo "Checking tools..."

command -v git >/dev/null || { echo "Git is required"; exit 1; }
command -v node >/dev/null || echo "Node.js not found (optional)"
command -v python3 >/dev/null || echo "Python not found (optional)"
command -v uv >/dev/null || echo "uv not found (optional)"
command -v pre-commit >/dev/null || echo "pre-commit not found (optional)"

echo ""
echo "Environment:"

node -v 2>/dev/null || true
python3 --version 2>/dev/null || true

if [ -f package.json ]; then
    echo ""
    echo "Installing Node dependencies..."
    npm install
fi

if [ -f pyproject.toml ] && command -v uv >/dev/null; then
    echo ""
    echo "Installing Python dependencies..."
    uv sync
fi

if [ -f .pre-commit-config.yaml ] && command -v pre-commit >/dev/null; then
    echo ""
    echo "Installing pre-commit hooks..."
    pre-commit install
fi

if [ -f .env.example ] && [ ! -f .env ]; then
    echo ""
    echo "Creating .env from .env.example"
    cp .env.example .env
fi

echo ""
echo "✅ Setup completed"
