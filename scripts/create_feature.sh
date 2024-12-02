#!/bin/bash

# Check if a feature name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <feature_name>"
  exit 1
fi

# Get the feature name from the argument
FEATURE_NAME=$1

# Convert the feature name to snake_case for consistency
FEATURE_NAME_SNAKE=$(echo "$FEATURE_NAME" | sed 's/\([A-Z]\)/_\1/g' | tr '[:upper:]' '[:lower:]' | sed 's/^_//' | sed 's/-/_/g')
# Define the base directory for features
BASE_DIR="./lib/features/$FEATURE_NAME_SNAKE"

# Define the folder structure
DIRECTORIES=(
  "$BASE_DIR/bindings"
  "$BASE_DIR/data/dtos"
  "$BASE_DIR/data/sources"
  "$BASE_DIR/data/implementations"
  "$BASE_DIR/data/mappers"
  "$BASE_DIR/domain/models"
  "$BASE_DIR/domain/interfaces"
  "$BASE_DIR/domain/usecases"
  "$BASE_DIR/presentation/controllers"
  "$BASE_DIR/presentation/screens"
  "$BASE_DIR/presentation/widgets"
)

# Create the directories
echo "Creating folder structure for feature: $FEATURE_NAME_SNAKE"
for DIR in "${DIRECTORIES[@]}"; do
  mkdir -p "$DIR"
done

# Create feature placeholder files
echo "Adding placeholder files..."
touch "$BASE_DIR/bindings/${FEATURE_NAME_SNAKE}_binding.dart"
touch "$BASE_DIR/data/dtos/${FEATURE_NAME_SNAKE}_dto.dart"
touch "$BASE_DIR/data/sources/${FEATURE_NAME_SNAKE}_remote_data_source.dart"
touch "$BASE_DIR/data/implementations/${FEATURE_NAME_SNAKE}_repository_impl.dart"
touch "$BASE_DIR/data/mappers/${FEATURE_NAME_SNAKE}_mapper.dart"
touch "$BASE_DIR/domain/models/${FEATURE_NAME_SNAKE}_model.dart"
touch "$BASE_DIR/domain/interfaces/${FEATURE_NAME_SNAKE}_repository.dart"
touch "$BASE_DIR/domain/usecases/get_${FEATURE_NAME_SNAKE}_usecase.dart"
touch "$BASE_DIR/presentation/controllers/${FEATURE_NAME_SNAKE}_controller.dart"
touch "$BASE_DIR/presentation/screens/${FEATURE_NAME_SNAKE}_screen.dart"
touch "$BASE_DIR/presentation/widgets/${FEATURE_NAME_SNAKE}_widget.dart"

# Add colors to the echo output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Confirm completion
echo -e "🗂️  ${GREEN}${FEATURE_NAME_SNAKE} feature folder structure with placeholder files created successfully at $BASE_DIR ${NC}"