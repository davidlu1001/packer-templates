SHELL := /bin/bash
TEMPLATES := \
	$(wildcard ci-*.json) \
	$(wildcard internal-*.json) \
	$(shell echo {jupiter-brain,play,worker}.json)
BRANCH_FILE := tmp/git-meta/packer-templates-branch
SHA_FILE := tmp/git-meta/packer-templates-sha

JQ ?= jq
SED ?= sed
GIT ?= git

%.json: %.yml
	@touch $@
	@chmod 0600 $@
	@echo generating $@ from $^
	@bin/yml2json < $^ | $(JQ) . > $@
	@chmod 0400 $@

.PHONY: all
all: $(TEMPLATES) $(BRANCH_FILE) $(SHA_FILE)

.PHONY: langs
langs:
	@for f in ci-*.json ; do echo $$f | $(SED) 's/ci-//;s/\.json//' ; done

$(BRANCH_FILE): .git/HEAD
	./bin/dump-git-meta ./tmp/git-meta

$(SHA_FILE): .git/HEAD
	./bin/dump-git-meta ./tmp/git-meta
