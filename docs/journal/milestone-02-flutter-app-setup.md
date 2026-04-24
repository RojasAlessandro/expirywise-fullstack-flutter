# Milestone 2: Flutter App Setup

## Date
2026-04-24

## What I built
I created the Flutter application inside the `mobile/expirywise_app` folder and successfully ran it on an Android emulator using Android Studio.

## What I learned
I learned how Flutter projects are structured, how to configure Flutter and Dart SDK paths in Android Studio, and how to run a Flutter app on an Android emulator.

## Problems I faced
I had to fix the Flutter SDK PATH, configure the Dart SDK, resolve an Android NDK issue, and rename the Flutter app folder from `expirewise_app` to `expirywise_app`.

## How I solved it
I added Flutter to the Windows PATH, configured Android Studio to use the correct Flutter and Dart SDK paths, deleted the broken NDK folder so it could be regenerated, and refreshed Flutter dependencies using `flutter clean` and `flutter pub get`.

## Next step
Clean the default Flutter counter app and replace it with the first ExpiryWise welcome screen.