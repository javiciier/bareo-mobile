#!/usr/bin/env bash

SCRIPTS_PATH="./dev_tools"
GIT_SCRIPTS_PATH="$SCRIPTS_PATH/git"
BUILD_SCRIPTS_PATH="$SCRIPTS_PATH/build"

echo "⚙️ 🧑🏻‍💻️ Setting up development environment...🧑🏻‍💻⚙️\n"

chmod -R +x "$SCRIPTS_PATH"

# Configure Git
bash "$GIT_SCRIPTS_PATH/setup_git_config.sh"
echo
bash "$GIT_SCRIPTS_PATH/setup_git_hooks.sh"
echo
bash "$GIT_SCRIPTS_PATH/setup_git_conventional_commits.sh"
echo

# Configure environment and third-party APIs
bash "$SCRIPTS_PATH/config/firebase_environment.sh"
echo

# Build project
bash "$BUILD_SCRIPTS_PATH/build_project.sh"
echo

echo "✅ 🧑🏻‍💻️ Development environment configured 🧑🏻‍💻 ✅️"
