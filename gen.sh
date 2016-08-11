#!/bin/sh
TARGET_NAME=$1
XCODE_SETTINGS="${TARGET_NAME}.settings"

xcodebuild -showBuildSettings -target $TARGET_NAME > ${XCODE_SETTINGS}
xcode_setting() {
    echo $(cat ${XCODE_SETTINGS} | awk "\$1 == \"${1}\" { print \$3 }")
}

export PODS_ROOT=$(xcode_setting "PODS_ROOT")
export PROJECT_FILE_PATH=$(xcode_setting "PROJECT_FILE_PATH")
export TARGET_NAME=$(xcode_setting "TARGET_NAME")
export PRODUCT_BUNDLE_IDENTIFIER=$(xcode_setting "PRODUCT_BUNDLE_IDENTIFIER")
export PRODUCT_MODULE_NAME=$(xcode_setting "PRODUCT_MODULE_NAME")
export BUILT_PRODUCTS_DIR=$(xcode_setting "BUILT_PRODUCTS_DIR")
export DEVELOPER_DIR=$(xcode_setting "DEVELOPER_DIR")
export SOURCE_ROOT=$(xcode_setting "SOURCE_ROOT")
export SRCROOT=$(xcode_setting "SRCROOT")
export SDKROOT=$(xcode_setting "SDKROOT")

${PODS_ROOT}/R.swift/rswift ${TARGET_NAME}