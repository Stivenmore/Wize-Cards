# Firebase Onboarding Guide (Workshop)

This guide explains everything each student needs to run this project with Firebase and Google Sign-In without committing secrets to Git.

## Goal

At the end of this setup, each student should be able to:

1. Run the app on Android.
2. Run the app on iOS (simulator or physical device).
3. Sign in with Google.
4. Keep Firebase credentials local-only (not committed to GitHub).

Optional fast path:

1. Use anonymous authentication (guest mode) as an alternative to Google Sign-In.

## Important Security Rules

Do NOT commit these files:

1. firebase.json
2. android/app/google-services.json
3. ios/Runner/GoogleService-Info.plist
4. lib/firebase_options.dart

These files are already ignored by .gitignore in this project.

## Prerequisites

Install and validate:

1. Flutter SDK
2. Xcode (for iOS)
3. Android Studio + Android SDK (for Android)
4. CocoaPods (for iOS dependencies)
5. Java (required for Android SHA fingerprints)

Useful checks:

```bash
flutter doctor
flutter devices
pod --version
java -version
```

## Project Setup Flow

## 1) Clone and install dependencies

```bash
git clone <your-private-repo-url>
cd wize_cards
flutter pub get
```

## 2) Get Firebase config files

The instructor should provide project access in Firebase Console or provide a secure internal channel with setup instructions.

Each student must have local copies of:

1. android/app/google-services.json
2. ios/Runner/GoogleService-Info.plist

Optional (if using FlutterFire CLI):

1. firebase.json
2. lib/firebase_options.dart

## 3) Android setup

1. Place the Android config file at:
   - android/app/google-services.json

2. Verify Android package name is exactly:
   - com.wizecards.wize_cards

3. Add SHA-1 and SHA-256 in Firebase (critical for Google login):

```bash
keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -rfc | openssl x509 -noout -fingerprint -sha1

keytool -exportcert -alias androiddebugkey -keystore ~/.android/debug.keystore -storepass android -rfc | openssl x509 -noout -fingerprint -sha256
```

4. In Firebase Console:
   - Project Settings -> Your apps -> Android app
   - Add both fingerprints
   - Download a fresh google-services.json
   - Replace android/app/google-services.json

5. Run Android:

```bash
flutter run -d <android_device_id>
```

## 4) iOS setup

1. Place iOS config file at:
   - ios/Runner/GoogleService-Info.plist

2. Ensure iOS bundle id matches Firebase exactly:
   - com.wizecards.wizeCards

3. Ensure these values exist in ios/Runner/Info.plist:
   - GIDClientID
   - CFBundleURLTypes with the reversed client id (com.googleusercontent.apps....)

4. Install iOS pods:

```bash
cd ios
pod install
cd ..
```

5. Run on iOS simulator:

```bash
open -a Simulator
flutter run -d ios
```

6. Run on iPhone (physical device):
   - Xcode -> Runner target -> Signing & Capabilities
   - Select Team (Apple ID works for local testing)
   - Enable Automatically manage signing
   - Then run:

```bash
flutter run -d <ios_device_id>
```

## 5) Firebase initialization strategy

This project initializes Firebase using lib/firebase_options.dart.

If this file is not shared, each student should generate it locally with FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

This will generate local firebase config files for the selected Firebase project.

## Alternative: Anonymous Login (Guest)

If students do not want to configure Google Sign-In immediately, they can use guest access.

Requirements:

1. Firebase Auth -> Sign-in method -> enable Anonymous.
2. App still needs Firebase configured (google-services.json / GoogleService-Info.plist / firebase_options.dart).

What students do NOT need for anonymous flow:

1. Google OAuth client setup.
2. Android SHA-1/SHA-256 specifically for Google Sign-In.
3. iOS Google Sign-In keys like GIDClientID or reversed URL scheme for Google callback.
4. Debugging Google-specific errors like `ApiException: 10` / `DEVELOPER_ERROR`.

Quick comparison (Google vs Guest):

| Topic | Google Sign-In | Guest (Anonymous) |
|---|---|---|
| Firebase base setup | Required | Required |
| Google OAuth setup | Required | Not required |
| Android SHA-1/SHA-256 for Google | Required | Not required |
| iOS GIDClientID and URL scheme for Google callback | Required | Not required |
| Identity persistence across reinstall | Stronger (account-based) | Weaker (can be lost) |
| Setup complexity for workshop | Higher | Lower |
| Best use case | Real identity/auth ownership | Fast onboarding and demos |

How to use in app:

1. On login screen, tap `Continue as Guest`.
2. The app signs in with `signInAnonymously()` and continues as authenticated user.

When to use this mode:

1. Workshops with many students where Google setup may take too long.
2. Quick demos where identity is not required.
3. Temporary onboarding before switching to Google login.

Known limitations of anonymous users:

1. If app is uninstalled, anonymous account can be lost.
2. Data migration may be needed if later linked to Google account.
3. Not ideal for production identity requirements.

## Common Errors and Fixes

## Error: sign_in_failed / ApiException: 10 / DEVELOPER_ERROR (Android)

Cause:

1. SHA fingerprints missing or wrong in Firebase.
2. Wrong package name in Firebase app.
3. Outdated google-services.json.

Fix:

1. Verify package name is com.wizecards.wize_cards.
2. Add SHA-1 and SHA-256 in Firebase.
3. Download new google-services.json.
4. Replace file and run:

```bash
flutter clean
flutter pub get
flutter run -d <android_device_id>
```

## Error: No active configuration. Make sure GIDClientID is set in Info.plist (iOS)

Cause:

1. Missing GIDClientID in ios/Runner/Info.plist.

Fix:

1. Copy CLIENT_ID from GoogleService-Info.plist.
2. Add it as GIDClientID in ios/Runner/Info.plist.
3. Ensure URL scheme exists with REVERSED_CLIENT_ID.

## Error: CocoaPods conflict GTMSessionFetcher/Core

Cause:

1. Podfile.lock has stale dependency versions.

Fix:

```bash
cd ios
pod update GTMSessionFetcher/Core
pod install
cd ..
```

## Error: iOS build fails with ModuleCache.noindex or SDKStatCaches.noindex

Cause:

1. Local Xcode cache corruption.

Fix:

```bash
rm -rf ~/Library/Developer/Xcode/DerivedData
mkdir -p ~/Library/Developer/Xcode/DerivedData
```

Then reopen Simulator and run again.

If needed, use a custom DerivedData location in Xcode Settings -> Locations.

## Error: iOS device not detected

Cause:

1. Device locked, not trusted, or Developer Mode disabled.

Fix:

1. Unlock iPhone and trust Mac.
2. Enable Developer Mode on device.
3. Confirm with:

```bash
flutter devices
```

## Error: Google sign in aborted by user

Cause:

1. User closed Google account picker.

Fix:

1. Retry sign-in and complete account selection.

## Error: Anonymous sign-in fails

Common causes:

1. Anonymous provider disabled in Firebase Auth.
2. Firebase not initialized correctly for platform.

Fix:

1. Enable Anonymous in Firebase Console.
2. Verify Firebase config files are in correct paths.
3. Run:

```bash
flutter clean
flutter pub get
cd ios && pod install && cd ..
flutter run -d <device_id>
```

## Team Workflow Recommendation (for 30+ devs)

1. Keep repository private.
2. Never commit Firebase secrets, even in private repos.
3. Share credentials through a secure internal channel.
4. Use a training-only Firebase project with limited quotas and strict rules.
5. Rotate keys after workshop ends.

## Instructor Checklist

Before class starts:

1. Firebase Auth -> enable Google provider.
2. Firebase apps configured:
   - Android: com.wizecards.wize_cards
   - iOS: com.wizecards.wizeCards
3. Android SHA-1 and SHA-256 added.
4. Fresh config files generated.
5. Firestore/Auth rules restricted for training usage.

## Student Quick Start (Copy/Paste)

```bash
flutter pub get
cd ios && pod install && cd ..
flutter devices
flutter run -d <device_id>
```

If login fails, check the Common Errors section above.
