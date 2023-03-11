install:
	python setup.py install

uninstall:
	pip uninstall pynance -y

update:
	make uninstall
	make install

techus_run:
	python run.py -n techus_forecast -k train
	python run.py -n techus_regr -k train
	python run.py -n techus_coint -k coint
	python run.py -n techus_infer -k infer

luxefr_run:
	python run.py -n luxefr_forecast -k train
	python run.py -n luxefr_regr -k train
	python run.py -n luxefr_coint -k coint
	python run.py -n luxefr_infer -k infer

deffr_run:
	python run.py -n deffr_forecast -k train
	python run.py -n deffr_regr -k train
	python run.py -n deffr_coint -k coint
	python run.py -n deffr_infer -k infer

runs:
	make techus_run
	make luxefr_run
	make deffr_run

clean:
	rm -rf pynance.egg-info/
	rm -rf **__pycache__/
	rm -rf dist/
	rm -rf build/

make crypto_live:
	python run.py -n crypto -k crypto


# Minimal makefile for Sphinx documentation

# You can set these variables from the command line, and also
# from the environment for the first two.
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
SOURCEDIR     = source
BUILDDIR      = build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
