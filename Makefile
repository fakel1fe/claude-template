.PHONY: setup test clean

setup:
	./scripts/setup.sh

test:
	@if [ -f package.json ]; then npm test --if-present; fi
	@if [ -f pyproject.toml ]; then uv run pytest; fi

clean:
	find . -name "__pycache__" -type d -exec rm -rf {} +
	find . -name "*.pyc" -delete
