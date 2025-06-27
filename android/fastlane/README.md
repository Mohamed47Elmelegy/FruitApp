fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## Android

### android firebase_distribution

```sh
[bundle exec] fastlane android firebase_distribution
```

Lane for Android Firebase App Distribution

### android bump_version

```sh
[bundle exec] fastlane android bump_version
```

Increase build number automatically in pubspec.yaml

### android shorebird_auto_update

```sh
[bundle exec] fastlane android shorebird_auto_update
```

Create and release Shorebird patch for automatic updates

### android shorebird_patch

```sh
[bundle exec] fastlane android shorebird_patch
```

Create Shorebird patch only (without releasing)

### android shorebird_release

```sh
[bundle exec] fastlane android shorebird_release
```

Release existing Shorebird patch

### android shorebird_full_release

```sh
[bundle exec] fastlane android shorebird_full_release
```

Full release with Firebase + Shorebird initial version

### android major_update

```sh
[bundle exec] fastlane android major_update
```

Major version update - Firebase + Shorebird (for big changes)

### android minor_update

```sh
[bundle exec] fastlane android minor_update
```

Minor update - Shorebird patch only (for small changes)

### android shorebird_status

```sh
[bundle exec] fastlane android shorebird_status
```

Check Shorebird status and releases

### android shorebird_clean_patch

```sh
[bundle exec] fastlane android shorebird_clean_patch
```

Clean and rebuild Shorebird patch

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
