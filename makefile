PHP_TAG=php/$(VERSION)-fpm

.PHONY: php-tag
php-tag:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make php-tag VERSION=x.y.z[-latest]"; \
		exit 1; \
	fi
	@git tag -d $(PHP_TAG)-fpm 2>/dev/null || true
	@git tag -a $(PHP_TAG)-fpm -m"$(PHP_TAG)-fpm"
	@git push -f origin $(PHP_TAG)-fpm
	@echo "Pushed tag: $(PHP_TAG)-fpm"