#!/bin/sh

flutter clean
flutter pub get
flutter packages pub run build_runner build --delete-conflicting-outputs
flutter gen-l10n
