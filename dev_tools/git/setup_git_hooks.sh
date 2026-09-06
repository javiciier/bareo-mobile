#!/usr/bin/env bash

echo "⚙️ Configuring Git Hooks for project..."

HOOK_FILE=".git/hooks/pre-commit"
cat << 'EOF' > "$HOOK_FILE"
#!/usr/bin/env bash
echo "Executing pre-commit checks..."

# Fix static code
echo "Applying dart fix..."
dart fix --apply
if [ $? -ne 0 ]; then
  echo "❌ Error while fixing dart code."
  exit 1
fi

# Sort imports (import_sorter dependency)
echo "Sorting imports..."
flutter pub run import_sorter:main
if [ $? -ne 0 ]; then
  echo "❌ Error while sorting imports."
  exit 1
fi

# Format code with dart format
echo "Formatting code..."
dart format .
if [ $? -ne 0 ]; then
  echo "❌ Error formatting code"
  exit 1
fi

echo "Adding changes to current commit..."
git add -u
echo "Pre-commit checks executed successfully."
EOF

# Grant execution permissions to the hook
chmod +x "$HOOK_FILE"
echo "✅ Git Hooks for project configurated successfully"