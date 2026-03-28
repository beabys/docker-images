PHP_TAG=php/$(shell echo $(VERSION) | sed 's/-latest//')-fpm

.PHONY: php-tag
php-tag:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make php-tag VERSION=x.y.z[-latest]"; \
		exit 1; \
	fi
	@git tag -d $(PHP_TAG) 2>/dev/null || true
	@git tag -a $(PHP_TAG) -m"$(PHP_TAG)"
	@git push -f origin $(PHP_TAG)
	@echo "Pushed tag: $(PHP_TAG)"