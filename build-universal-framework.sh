#!/usr/bin/env bash

set -e

BASE_PWD="$PWD"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
OUTPUT_DIR="${SCRIPT_DIR}/build/"
WORKSPACE_PATH="${SCRIPT_DIR}/Example/libsodium.xcworkspace"
PODS_PROJECT="${SCRIPT_DIR}/Example/Pods/Pods.xcodeproj"
FRAMEWORK_NAME="libsodium"

# Validate workspace exists
if [ ! -d "${WORKSPACE_PATH}" ]; then
	echo "Error: Workspace not found at ${WORKSPACE_PATH}"
	echo "Please run 'pod install' in the Example directory first."
	exit 1
fi

# Validate Pods project exists
if [ ! -d "${PODS_PROJECT}" ]; then
	echo "Error: Pods project not found at ${PODS_PROJECT}"
	echo "Please run 'pod install' in the Example directory first."
	exit 1
fi

# build clean up
rm -rf ./build
rm -rf lib/*

echo $'\n\n ✅ Clean build'

echo $'\n\n Build Started............'

# Build the libsodium pod scheme from workspace
COMMON_SETUP="-workspace ${WORKSPACE_PATH} -scheme libsodium -configuration Release -quiet SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES"

# iOS

echo $'\n\n 📱 Building platform iOS .........\n'
DERIVED_DATA_PATH=$( mktemp -d )
if ! xcrun xcodebuild build \
	$COMMON_SETUP \
	-derivedDataPath "${DERIVED_DATA_PATH}" \
	-destination 'generic/platform=iOS'; then
	echo "Error: iOS build failed"
	rm -rf "${DERIVED_DATA_PATH}"
	exit 1
fi

mkdir -p "${OUTPUT_DIR}/iphoneos"
# Look for the built libsodium framework in the derived data
# CocoaPods builds frameworks
FRAMEWORK_PATH=$(find "${DERIVED_DATA_PATH}" -path "*/Release-iphoneos/libsodium/libsodium.framework" -type d 2>/dev/null | head -1)

if [ -z "${FRAMEWORK_PATH}" ]; then
	echo "Error: libsodium framework not found in build products"
	echo "Searching for frameworks in derived data..."
	find "${DERIVED_DATA_PATH}" -name "*.framework" -type d 2>/dev/null | head -5 || true
	rm -rf "${DERIVED_DATA_PATH}"
	exit 1
fi

# Copy the entire framework
ditto "${FRAMEWORK_PATH}" "${OUTPUT_DIR}/iphoneos/${FRAMEWORK_NAME}.framework"

rm -rf "${DERIVED_DATA_PATH}"
echo "   ✅ iOS framework built successfully"

# iOS Simulator

echo $'\n\n 📱 Building platform iOS Simulator .........\n'
DERIVED_DATA_PATH=$( mktemp -d )
if ! xcrun xcodebuild build \
	$COMMON_SETUP \
	-derivedDataPath "${DERIVED_DATA_PATH}" \
	-destination 'generic/platform=iOS Simulator'; then
	echo "Error: iOS Simulator build failed"
	rm -rf "${DERIVED_DATA_PATH}"
	exit 1
fi

mkdir -p "${OUTPUT_DIR}/iphonesimulator"
# Look for the built libsodium framework
FRAMEWORK_PATH=$(find "${DERIVED_DATA_PATH}" -path "*/Release-iphonesimulator/libsodium/libsodium.framework" -type d 2>/dev/null | head -1)

if [ -z "${FRAMEWORK_PATH}" ]; then
	echo "Error: libsodium framework not found in build products"
	echo "Searching for frameworks in derived data..."
	find "${DERIVED_DATA_PATH}" -name "*.framework" -type d 2>/dev/null | head -5 || true
	rm -rf "${DERIVED_DATA_PATH}"
	exit 1
fi

# Copy the entire framework
ditto "${FRAMEWORK_PATH}" "${OUTPUT_DIR}/iphonesimulator/${FRAMEWORK_NAME}.framework"

rm -rf "${DERIVED_DATA_PATH}"
echo "   ✅ iOS Simulator framework built successfully"

# XCFRAMEWORK
echo $'\n\n 📱 Building xcframework .........\n'
mkdir -p "${SCRIPT_DIR}/lib/Frameworks"
if ! xcrun xcodebuild -quiet -create-xcframework \
	-framework "${OUTPUT_DIR}/iphoneos/${FRAMEWORK_NAME}.framework" \
	-framework "${OUTPUT_DIR}/iphonesimulator/${FRAMEWORK_NAME}.framework" \
	-output "${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework"; then
	echo "Error: Failed to create xcframework"
	exit 1
fi

# Validate xcframework was created
if [ ! -d "${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework" ]; then
	echo "Error: xcframework was not created at expected location"
	exit 1
fi

echo $'\n\n ✅ ${FRAMEWORK_NAME}.xcframework created successfully!'
echo "   Location: ${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework"

# Fix CocoaPods rsync permission issues
echo $'\n\n 🔧 Fixing rsync permission issues for CocoaPods...'
codesign --remove-signature "${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework" || true
xattr -r -d com.apple.quarantine "${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework" || true
chmod -R u+rw "${SCRIPT_DIR}/lib/Frameworks/${FRAMEWORK_NAME}.xcframework"
echo "   ✅ Permission fix applied"

echo $'\n\n ✅ Build complete! Framework is ready for distribution.'
echo "   Framework location: lib/Frameworks/${FRAMEWORK_NAME}.xcframework"

#open reveal folder
# open "${SCRIPT_DIR}/lib/"

#end
cd ${BASE_PWD}
