# njewebsite

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Deploying

flutter Clean
flutter pub get
flutter build web --base-href /website/ --release

cd build/web
git init
git add .
git commit -m "Deploy NJE"
git branch -M main
git remote add origin https://github.com/NagaJyothiElectricals/website.git
git git config --global http.postBuffer 524288000
git push -u origin main
