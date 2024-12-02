#!/bin/bash

BUILD_NAME=0.1.0
BUILD_NUMBER=1
APK_NAME=app_name
APK_DIR="./apks"

# Create the 'apks' directory if it doesn't exist
mkdir -p $APK_DIR

# Build the APK
echo "Building apk with build-name: ${BUILD_NAME} and build-number: ${BUILD_NUMBER}..."
flutter build apk --build-name=${BUILD_NAME} --build-number=${BUILD_NUMBER}

# Define the path for the APK
DEFAULT_APK_PATH="./build/app/outputs/flutter-apk/app-release.apk"
DEST_APK_PATH="${APK_DIR}/${APK_NAME}.apk"

# Check if the APK already exists
if [ -f "$DEST_APK_PATH" ]; then
    # Use stat to get the last modification time
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS
        DATE_SUFFIX=$(stat -f "%Sm" -t "%Y-%m-%d_%H-%M-%S" "$DEST_APK_PATH")
    else
        # Linux
        DATE_SUFFIX=$(stat -c "%y" "$DEST_APK_PATH" | sed 's/[: ]/_/g' | cut -d'.' -f1)
    fi

    # If DATE_SUFFIX is still empty, assign a fallback
    if [ -z "$DATE_SUFFIX" ]; then
        DATE_SUFFIX=$(date +'%Y-%m-%d_%H-%M-%S')
    fi

    # Rename the existing APK by appending the created date
    mv "$DEST_APK_PATH" "${APK_DIR}/${APK_NAME}_${DATE_SUFFIX}.apk"
    echo "Renamed existing ${APK_NAME}.apk in ${APK_DIR} to ${APK_NAME}_${DATE_SUFFIX}.apk"
fi

# Move the newly created APK to the 'apks' directory
mv "$DEFAULT_APK_PATH" "$DEST_APK_PATH"

# Add colors to the echo output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo "======================================================================"
echo -e "🗂️  ${GREEN}Moved ${APK_NAME}.apk from ${DEFAULT_APK_PATH} to ${APK_DIR}${NC}"
echo "======================================================================"