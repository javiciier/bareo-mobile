#!/usr/bin/env bash

PROJECT_ID="bareo-d3965"

install_firebase_cli() {
  if ! command -v firebase &> /dev/null; then
      echo "⚠ Firebase CLI not detected. Installing..."
      curl -sL firebase.tools | bash
  else
      echo "Firebase CLI already installed."
  fi
}

firebase_login() {
  echo "Firebase login"
  firebase login
}

configure_firebase_cli () {
  echo "Configuring fluterfire..."
  dart pub global deactivate flutterfire_cli
  dart pub global deactivate fvm

  PUB_CACHE_DIR="$HOME/.pub-cache/bin"
  if [[ ":$PATH:" != *"$PUB_CACHE_DIR:"* ]]; then
    export PATH="$PUB_CACHE_DIR:$PATH"
  fi

  dart pub global activate fvm
  dart pub global activate flutterfire_cli

  echo "Generating Firebase configuration files in project..."
  flutterfire configure \
    --project=$PROJECT_ID \
    --platforms=android,ios \
    --yes
}

import_firebase_in_project() {
  GITIGNORE_FILE=".gitignore"

  echo "Installing 'firebase_core' dependency"
  flutter pub add firebase_core

  echo "Adding files to $GITIGNORE_FILE"
  if ! grep -q "# Firebase configuration files" "$GITIGNORE_FILE"; then
    cat << 'EOF' >> "$GITIGNORE_FILE"

  # Firebase configuration files
  firebase.json
  infrastructure/thirdparty/firebase/firebase_options.dart
  /android/app/google-services.json
  /ios/Runner/GoogleService-Info.plist
  /ios/Runner.xcodeproj/project.xcworkspace/xcshareddata/swiftpm/Package.resolved
  /ios/Runner.xcworkspace/xcshareddata/swiftpm/Package.resolved
  /lib/infrastructure/thirdparty/firebase/firebase_options.dart

EOF
  fi

  echo "Moving firebase_options.dart to lib/infrastructure/thirdparty/firebase/firebase_options.dart"
  mv lib/firebase_options.dart lib/infrastructure/thirdparty/firebase/firebase_options.dart
  echo "Remember to import firebase_options.dart"
}


echo "⚙️ Configuring Firebase environment for current project..."

install_firebase_cli
firebase_login
configure_firebase_cli
import_firebase_in_project

echo "✅ Firebase configuration completed successfully!"