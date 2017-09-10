platform = --platform ios --platform macos
xcode_flags = -project "Scalpture.xcodeproj" -scheme "Scalpture" -configuration "Release" DSTROOT=/tmp/Scalpture.dst
xcode_flags_test = -project "Scalpture.xcodeproj" -scheme "Scalpture" -configuration "Debug"
components_plist = "Supporting Files/Components.plist"
temporary_dir = /tmp/Scalpture.dst

bootstrap:
	carthage bootstrap $(platform)

update:
	carthage update $(platform)

synx:
	synx Scalpture.xcodeproj

clean:
	rm -rf $(temporary_dir)
	xcodebuild $(xcode_flags) clean

test: clean bootstrap
	xcodebuild $(xcode_flags_test) test

lint:
	swiftlint

.PHONY: bootstrap update synx clean test lint

