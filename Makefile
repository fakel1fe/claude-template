.PHONY: setup test lint format clean

setup:
	./scripts/setup.sh

test:
	@if [ -f package.json ]; then npm test --if-present; fi
	@if [ -f pyproject.toml ]; then uv run pytest || [ $? -eq 5 ]; fi

lint:
	@if [ -f package.json ]; then npm run lint --if-present; fi
	@if [ -f pyproject.toml ]; then uv run ruff check .; fi

format:
	@if [ -f package.json ]; then npm run format --if-present; fi
	@if [ -f pyproject.toml ]; then uv run ruff format .; fi

clean:
	find . -name "__pycache__" -type d -exec rm -rf {} +
	find . -name "*.pyc" -delete
