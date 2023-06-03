
DART_CMD=dart
EXAMPLE_DIR=example
FLUTTER=flutter
FLUTTER_CMD=cd $(EXAMPLE_DIR) && $(FLUTTER)

export PATH := $(HOME)/.pub-cache/bin:$(PATH)


.PHONY: all
all: get test analyze doc

.PHONY: test
test:
	@echo "Running tests..."
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
doc: get
	@echo "Generating documentation..."
	$(DART_CMD) doc

.PHONY: analyze
analyze: get
	@echo "Analyzing..."
	$(DART_CMD) analyze && $(FLUTTER_CMD) analyze


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


