PHP_TAG=php/$(shell echo $(VERSION) | sed 's/-latest//')-fpm

.PHONY: php-tag
php-tag:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make php-tag VERSION=x.y.z[-latest]"; \
		exit 1; \
	fi
	@if echo "$(VERSION)" | grep -q "latest"; then \
		gh workflow run php-fpm-grpc.yml -f VERSION=$(shell echo $(VERSION) | sed 's/-latest//') -f LATEST=true --repo $(shell git remote get-url origin | sed 's|.*github.com/||' | sed 's|.git||'); \
	else \
		gh workflow run php-fpm-grpc.yml -f VERSION=$(VERSION) -f LATEST=false --repo $(shell git remote get-url origin | sed 's|.*github.com/||' | sed 's|.git||'); \
	fi