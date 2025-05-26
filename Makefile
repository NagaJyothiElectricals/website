# ----------  CONFIG  ----------
BASE_HREF   := '/'
GITHUB_REPO := https://github.com/NagaJyothiElectricals/website.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')
CUSTOM_DOMAIN := www.nagajyothielectricals.com

# ----------  TASKS  ----------
.PHONY: deploy-web clean-build commit-all push-all

deploy-web: clean-build build commit-all push-all  ## Build, commit, and deploy entire project

clean-build:
	@echo "🧹 Cleaning project"
	flutter clean
	@echo "📦 Getting packages"
	flutter pub get

build:
	@echo "🛠️ Building web (base-href=$(BASE_HREF))"
	flutter build web --base-href $(BASE_HREF) --release
	@echo "Creating CNAME file in build/web"
	echo "$(CUSTOM_DOMAIN)" > build/web/CNAME

commit-all:
	@echo "📂 Moving build output into docs/"
	rm -rf docs
	mv build/web docs

	@echo "📤 Adding all files to git"
	git add .
	@git commit -m "Full project backup including build v$(BUILD_VERSION)" || echo "No changes to commit"

push-all:
	@echo "🚀 Pushing all files to $(GITHUB_REPO)"
	git push origin main

	@echo "✅ Deployment complete! Visit:"
	@echo "   https://nagajyothielectricals.github.io$(BASE_HREF)"
