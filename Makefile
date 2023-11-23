# check if fvm command exists, otherwise use empty string
FVM_CMD := $(shell command -v fvm 2> /dev/null)
DART_CMD=$(FVM_CMD) dart
EXAMPLE_DIR=example
FLUTTER=$(FVM_CMD) flutter
FLUTTER_CMD=cd $(EXAMPLE_DIR) && $(FLUTTER)

export PATH := $(HOME)/.pub-cache/bin:$(PATH)


.PHONY: all
all: version get analyze dry-run test doc

.PHONY: publish
publish: all
	@echo "Publishing package..."
	$(DART_CMD) pub publish --force

.PHONY: dry-run
dry-run:
	@echo "Running dry-run..."
	$(DART_CMD) pub publish --dry-run

.PHONY: kill
kill: 
	@echo "Killing service..."
	@kill -9 $(shell lsof -t -i:8181) || echo "Port 8181 is not in use"

.PHONY: test
test:
	@echo "Running tests..."
	$(DART_CMD) pub global activate coverage
	$(DART_CMD) run coverage:test_with_coverage && $(FLUTTER_CMD) test
	$(MAKE) format_lcov

.PHONY: clean
clean:
	@echo "Cleaning..."
	$(FLUTTER_CMD) clean


.PHONY: get
get: clean
	@echo "Getting dependencies..."
	$(DART_CMD) pub get && $(FLUTTER_CMD) pub get


.PHONY: doc
doc:
	@echo "Generating documentation..."
	$(DART_CMD) doc

.PHONY: analyze
analyze:
	@echo "Analyzing..."
	$(DART_CMD) analyze && $(FLUTTER_CMD) analyze
	$(DART_CMD) format --set-exit-if-changed .

.PHONY: version
version:
	@echo "Checking version..."
	$(DART_CMD) --version
	$(FLUTTER) --version


### Coverage ###

# ensure all files listed in the coverage report are relative paths
CWD := $(shell pwd)
FILES := $(shell find coverage/*.info -type f ! -path "$(CWD)")

.PHONY: format_lcov
format_lcov:
	@echo "Formatting lcov.info..."
	@echo "CWD: $(CWD)"
	@echo "FILES: $(FILES)"
	@for file in $(FILES); do \
		sed -i'' -e 's|$(CWD)/||g' $$file ; \
	done


