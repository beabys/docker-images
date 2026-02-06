PHP_TAG=php/$(VERSION)-fpm

.PHONY: php-tag
php-tag:
	@if [ -z "$(VERSION)" ]; then \
		echo "Usage: make php-tag VERSION=x.y.z [LATEST=true]"; \
		exit 1; \
	fi
	# create/update the version tag
	@git tag -d $(PHP_TAG) 2>/dev/null || true
	@git tag -a $(PHP_TAG) -m"$(PHP_TAG)"
	# if requested, also create/update php/latest pointing to the same commit
	@if [ "$(LATEST)" = "true" ]; then \
		git tag -d php/latest 2>/dev/null || true; \
		git tag -a php/latest -m"php/latest"; \
		git push -f origin $(PHP_TAG) php/latest; \
		echo "Pushed tags: $(PHP_TAG) and php/latest"; \
	else \
		git push -f origin $(PHP_TAG); \
		echo "Pushed tag: $(PHP_TAG)"; \
	fi