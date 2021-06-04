SHELL := /bin/bash

install:
	python3 -m venv ~/.venv
	( \
		source ~/.venv/bin/activate; \
		pip install -e .; \
		pip check; \
	)

updb:
	# flask db init
	# flask db migrate
	FLASK_APP=webapp/app flask db upgrade

shell:
	FLASK_APP=webapp/app flask shell

check:
	isort -l 99 webapp
	black -l 99 -t py38 webapp

run:
	FLASK_APP=webapp/app flask run --host=0.0.0.0

clean:
	@find . -name '*.py[co]' -exec rm --force {} \;
	@find . -name '*~' -exec rm --force {} \;
	@find . -name '__pycache__' -exec rm -rf {} \;
	rm -rf *.egg-info
