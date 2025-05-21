# Halo Alert

## Features

Simple alert dialog for flutter

## workflow

1. Add features
   1. Check if new features (files) are added to `lib/src/halo_alert.dart`
   2. Write Unit Test if possible
2. Update version in `pubspec.yaml`
3. Update `CHANGELOG.md`
4. `git add .;git add .;git add .;git commit -m 'New feature'; git fetch;`
5. Run `flutter pub publish`

## How to use

```dart
void main() {
  runApp(
    MaterialApp(
      home: MainApp(),
      builder: (context, child) {
        return Stack(children: [child!, Alert.deploy()]);
      },
    ),
  );
}
```
