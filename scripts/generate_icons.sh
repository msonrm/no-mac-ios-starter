#!/bin/bash
# Generate iOS app icons from a 1024x1024 source image
#
# Usage:
#   1. Place your 1024x1024 icon as "AppIcon.png" in the project root
#   2. Run: ./scripts/generate_icons.sh
#
# Requirements:
#   - ImageMagick (brew install imagemagick)

set -e

SOURCE_IMAGE="AppIcon.png"
ICON_DIR="Assets.xcassets/AppIcon.appiconset"

# Check if source image exists
if [ ! -f "$SOURCE_IMAGE" ]; then
    echo "Error: Source image $SOURCE_IMAGE not found"
    echo "Please place your 1024x1024 app icon as AppIcon.png in the project root"
    exit 1
fi

# Check if ImageMagick is installed
if ! command -v convert &> /dev/null; then
    echo "Error: ImageMagick is not installed. Install with: brew install imagemagick"
    exit 1
fi

# Create icon directory if it doesn't exist
mkdir -p "$ICON_DIR"

echo "Generating icons from $SOURCE_IMAGE..."

# Remove alpha channel and resize icons
# -background white -alpha remove -alpha off ensures no alpha channel

# iPhone icons
convert "$SOURCE_IMAGE" -resize 40x40 -background white -alpha remove -alpha off "$ICON_DIR/Icon-20@2x.png"
convert "$SOURCE_IMAGE" -resize 60x60 -background white -alpha remove -alpha off "$ICON_DIR/Icon-20@3x.png"
convert "$SOURCE_IMAGE" -resize 58x58 -background white -alpha remove -alpha off "$ICON_DIR/Icon-29@2x.png"
convert "$SOURCE_IMAGE" -resize 87x87 -background white -alpha remove -alpha off "$ICON_DIR/Icon-29@3x.png"
convert "$SOURCE_IMAGE" -resize 80x80 -background white -alpha remove -alpha off "$ICON_DIR/Icon-40@2x.png"
convert "$SOURCE_IMAGE" -resize 120x120 -background white -alpha remove -alpha off "$ICON_DIR/Icon-40@3x.png"
convert "$SOURCE_IMAGE" -resize 120x120 -background white -alpha remove -alpha off "$ICON_DIR/Icon-60@2x.png"
convert "$SOURCE_IMAGE" -resize 180x180 -background white -alpha remove -alpha off "$ICON_DIR/Icon-60@3x.png"

# iPad icons
convert "$SOURCE_IMAGE" -resize 20x20 -background white -alpha remove -alpha off "$ICON_DIR/Icon-20.png"
convert "$SOURCE_IMAGE" -resize 40x40 -background white -alpha remove -alpha off "$ICON_DIR/Icon-20-ipad@2x.png"
convert "$SOURCE_IMAGE" -resize 29x29 -background white -alpha remove -alpha off "$ICON_DIR/Icon-29.png"
convert "$SOURCE_IMAGE" -resize 58x58 -background white -alpha remove -alpha off "$ICON_DIR/Icon-29-ipad@2x.png"
convert "$SOURCE_IMAGE" -resize 40x40 -background white -alpha remove -alpha off "$ICON_DIR/Icon-40.png"
convert "$SOURCE_IMAGE" -resize 80x80 -background white -alpha remove -alpha off "$ICON_DIR/Icon-40-ipad@2x.png"
convert "$SOURCE_IMAGE" -resize 76x76 -background white -alpha remove -alpha off "$ICON_DIR/Icon-76.png"
convert "$SOURCE_IMAGE" -resize 152x152 -background white -alpha remove -alpha off "$ICON_DIR/Icon-76@2x.png"
convert "$SOURCE_IMAGE" -resize 167x167 -background white -alpha remove -alpha off "$ICON_DIR/Icon-83.5@2x.png"

# App Store icon
convert "$SOURCE_IMAGE" -resize 1024x1024 -background white -alpha remove -alpha off "$ICON_DIR/Icon-1024.png"

echo "✅ Icons generated successfully!"

# Generate Contents.json
cat > "$ICON_DIR/Contents.json" << 'EOF'
{
  "images" : [
    {
      "filename" : "Icon-20@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "20x20"
    },
    {
      "filename" : "Icon-20@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "20x20"
    },
    {
      "filename" : "Icon-29@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "29x29"
    },
    {
      "filename" : "Icon-29@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "29x29"
    },
    {
      "filename" : "Icon-40@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "40x40"
    },
    {
      "filename" : "Icon-40@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "40x40"
    },
    {
      "filename" : "Icon-60@2x.png",
      "idiom" : "iphone",
      "scale" : "2x",
      "size" : "60x60"
    },
    {
      "filename" : "Icon-60@3x.png",
      "idiom" : "iphone",
      "scale" : "3x",
      "size" : "60x60"
    },
    {
      "filename" : "Icon-20.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "20x20"
    },
    {
      "filename" : "Icon-20-ipad@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "20x20"
    },
    {
      "filename" : "Icon-29.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "29x29"
    },
    {
      "filename" : "Icon-29-ipad@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "29x29"
    },
    {
      "filename" : "Icon-40.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "40x40"
    },
    {
      "filename" : "Icon-40-ipad@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "40x40"
    },
    {
      "filename" : "Icon-76.png",
      "idiom" : "ipad",
      "scale" : "1x",
      "size" : "76x76"
    },
    {
      "filename" : "Icon-76@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "76x76"
    },
    {
      "filename" : "Icon-83.5@2x.png",
      "idiom" : "ipad",
      "scale" : "2x",
      "size" : "83.5x83.5"
    },
    {
      "filename" : "Icon-1024.png",
      "idiom" : "ios-marketing",
      "scale" : "1x",
      "size" : "1024x1024"
    }
  ],
  "info" : {
    "author" : "xcode",
    "version" : 1
  }
}
EOF

echo "✅ Contents.json generated!"
