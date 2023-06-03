
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
	$(DART_CMD) pub global run coverage:test_with_coverage && $(FLUTTER_CMD) test

.PHONY: clean
clean:
	@echo "Cleaning..."
	$(FLUTTER_CMD) clean


.PHONY: get
get: clean
	@echo "Getting dependencies..."
	$(DART_CMD) pub global activate coverage
	$(DART_CMD) pub get && $(FLUTTER_CMD) pub get


.PHONY: doc
doc: get
	@echo "Generating documentation..."
	$(DART_CMD) doc

.PHONY: analyze
analyze: get
	@echo "Analyzing..."
	$(DART_CMD) analyze && $(FLUTTER_CMD) analyze


