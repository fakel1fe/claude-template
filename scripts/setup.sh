#!/bin/bash

set -e

echo "🚀 Project setup started"

echo ""
echo "Checking tools..."

command -v git >/dev/null || { echo "Git is required"; exit 1; }
command -v node >/dev/null || { echo "Node.js is required"; exit 1; }
command -v uv >/dev/null || echo "uv not found (optional)"

echo ""
echo "Node:"
node -v

echo ""
echo "Python:"
python3 --version || true

if [ -f package.json ]; then
    echo ""
    echo "Installing Node dependencies..."
    npm install
fi

if [ -f .env.example ] && [ ! -f .env ]; then
    echo ""
    echo "Creating .env from .env.example"
    cp .env.example .env
fi

echo ""
echo "✅ Setup completed"
