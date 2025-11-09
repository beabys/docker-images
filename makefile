PHP_TAG=php/$(VERSION)-fpm

.PHONY: php-tag
php-tag:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make tag VERSION=x.y.z"; \
		exit 1; \
	fi
	@git tag -d $(PHP_TAG) 2>/dev/null; true
	@git tag -a $(PHP_TAG) -m"$(PHP_TAG)"
	@git push -f origin $(PHP_TAG) 