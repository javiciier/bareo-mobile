#!/usr/bin/env bash

# More details at: https://docs.flutter.dev/reference/flutter-cli#flutter-commands

echo "🏗️ Building project..."

# Build project
echo "⏬ Downloading dependencies..."
#flutter clean
flutter pub get

# Generate i18n files
echo
echo "🌍 Generating localization (l10n) files..."
flutter gen-l10n

# Apply automatic code fixes
echo
echo "🩹  Applying code fixes..."
dart fix --apply

# Optimize imports
echo
echo "😵 Optimizing imports..."
dart fix --apply


echo
echo "✅ Project built succesfully"