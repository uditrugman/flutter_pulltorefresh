
VERSION := $(shell sed -E -n -e "s/^version: +([0-9.+]+).*/\1/p" pubspec.yaml)
# VERSION := $(shell ./scripts/version.sh)
VERSION_CODE := $(shell sed -E -n -e "s/^versionCode: +([0-9.]+)/\1/p" pubspec.yaml)


all:

version:
	@echo "${VERSION}"

versionCode:
	@echo versionCode: "${VERSION_CODE}"

versions: version versionCode

clean:
	fvm flutter clean

get:
	fvm flutter pub get

test: get
	fvm flutter test

outdated:
	fvm flutter pub outdated
	
publish: 
	fvm flutter pub publish
