# If jupyter lives in a virtualenv, either activate it or pass the path:
#   make test JUPYTER=~/venv/bin/jupyter

JUPYTER ?= jupyter

.PHONY: help test serve

help:           ## list the targets
	@grep -E '^[a-z]+:.*##' $(MAKEFILE_LIST) | sed 's/:.*##/\t/'

test:           ## run every notebook top to bottom, without changing them
	@tmp=$$(mktemp -d); \
	$(JUPYTER) nbconvert --to notebook --execute \
	  --ExecutePreprocessor.timeout=180 --output-dir "$$tmp" \
	  notebooks/*.ipynb && echo "all notebooks ran clean"; \
	status=$$?; rm -rf "$$tmp"; exit $$status

serve:          ## preview the website at http://localhost:4000/documentation-template/
	docker compose up
