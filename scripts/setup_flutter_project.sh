#!/bin/bash

# Add colors to the echo output
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Check for required parameters
if [[ $# -lt 1 ]]; then
  echo -e "${RED}Usage: ./setup_flutter_project.sh <project_name> [-d]${NC}"
  exit 1
fi

# Input parameters
PROJECT_NAME=$1
DELETE_TEMPLATE=false
FLUTTER_TEMPLATE_NAME=flutter_project_template
PLATFORMS=android,ios

# Check for -d flag
if [[ $2 == "-d" ]]; then
  DELETE_TEMPLATE=true
fi

# Define directories and files to copy
TEMPLATE_DIR="$(pwd)"
TARGET_DIR="../$PROJECT_NAME"

FOLDERS_TO_COPY=("apks" "assets" "scripts" "lib" "test")
FILES_TO_COPY=(".env" "pubspec.yaml")

# Step 1: Create the Flutter project
echo -e "${GREEN}Creating New Flutter project: $PROJECT_NAME${NC}"
flutter create --template=app --empty --platforms=$PLATFORMS "$TARGET_DIR"

if [[ $? -ne 0 ]]; then
  echo -e "${RED}Failed to create Flutter project.${NC}"
  exit 1
fi
echo -e "------------------------------------------------------------------"

# Step 2: Copy folders and files to the new project
echo -e "${GREEN}Copying folders and files to your new project...${NC}"
for folder in "${FOLDERS_TO_COPY[@]}"; do
  if [[ -d "$TEMPLATE_DIR/$folder" ]]; then
    echo "Copying folder: $folder"
    cp -r "$TEMPLATE_DIR/$folder" "$TARGET_DIR"
  fi
done

for file in "${FILES_TO_COPY[@]}"; do
  if [[ -f "$TEMPLATE_DIR/$file" ]]; then
    echo "Copying file: $file"
    cp "$TEMPLATE_DIR/$file" "$TARGET_DIR"
  fi
done
echo -e "------------------------------------------------------------------"

export LC_ALL=C.UTF-8

# Step 3: Replace all occurrences of FLUTTER_TEMPLATE_NAME with the project name
echo -e "${GREEN}Updating file importes in your project...${NC}"
find "$TARGET_DIR" -type f -exec sed -i "" "s/$FLUTTER_TEMPLATE_NAME/$PROJECT_NAME/g" {} \;
echo -e "------------------------------------------------------------------"

# Step 4: Update the pubspec.yaml file
PUBSPEC_FILE="$TARGET_DIR/pubspec.yaml"
if [[ -f "$PUBSPEC_FILE" ]]; then
  echo -e "${GREEN}Updating project name in pubspec.yaml${NC}"
  sed -i "" "s/^name: .*/name: $PROJECT_NAME/" "$PUBSPEC_FILE"
else
  echo -e "${RED}pubspec.yaml not found in $TARGET_DIR.${NC}"
fi
echo -e "------------------------------------------------------------------"


# Step 5: Update the scripts
BUILD_APK_SCRIPT="$TARGET_DIR/scripts/build_apk.sh"
if [[ -f "$BUILD_APK_SCRIPT" ]]; then
  echo -e "${GREEN}Updating project name in ${NC}"
  sed -i "" "s/^name: .*/name: $PROJECT_NAME/" "$PUBSPEC_FILE"
else
  echo -e "${RED}pubspec.yaml not found in $TARGET_DIR.${NC}"
fi
echo -e "------------------------------------------------------------------"


# Step 5: Optionally delete the template folder
if $DELETE_TEMPLATE; then
  echo -e "${GREEN}Deleting template folder: $TEMPLATE_DIR${NC}"
  rm -rf "$TEMPLATE_DIR"
echo -e "------------------------------------------------------------------"
fi

echo -e "✅  ${GREEN}${PROJECT_NAME} project is setup successfully!${NC}"
echo -e "------------------------------------------------------------------"
