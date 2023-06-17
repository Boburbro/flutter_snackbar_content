A package that lets you uplift your SnackBar or MaterialBanner experience in the app.

## 🛠 Attributes
- `title`: Top label that will be shown in the body
- `message`: Body message reflecting some error message, success message etc.
- `color`: Color of SnackBar body
- `contentType`: ContentType class reflecting failure, success, help or warning.
- `inMaterialBanner`: Simply configure the working according to `showMaterialBanner`

## 📱 Usage
To use the package:
- add the dependency to your pubspec.yaml file

```yaml
dependencies:
  flutter:
      sdk: flutter

  awesome_snackbar_content: <latest-package>
```

Then import it in your flutter project:
```
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
```

## 👀 SnackBar Looks
Below are the looks of various types in package used as Snackbar

### 🔴 Failure
<img src="" height='600px' />

### ✅ Success
<img src="" height='600px' />

### ❔ Help
<img src="" height='600px' />

### ⚠ Warning
<img src="" height='600px' />

## 👀 Material Banner Looks
Below are the looks of various types in package used as Snackbar

### 🔴 Failure
<img src="" height='600px' />

### ✅ Success
<img src="" height='600px' />

### ❔ Help
<img src="" height='600px' />

### ⚠ Warning
<img src="" height='600px' />

### 💻 Example
Below is a basic example usage of the `awesome_snackbar_content`

```dart
import 'package:flutter/material.dart';
import 'package:flutter_snackbar_content/flutter_snackbar_content.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              child: const Text('Show SnackBar'),
              onPressed: () {
                const snackBar = SnackBar(
                  /// need to set following properties for best effect of flutter_snackbar_content
                  elevation: 0,
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Colors.transparent,
                  content: FlutterSnackbarContent(
                    message:
                    'This is an example error message that will be shown in the body of snackbar!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.help,
                  ),
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(snackBar);
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text('Show Material Banner'),
              onPressed: () {
                const materialBanner = MaterialBanner(
                  /// need to set following properties for best effect of flutter_snackbar_content
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  forceActionsBelow: true,
                  content: FlutterSnackbarContent(
                    message:
                    'This is an example error message that will be shown in the body of materialBanner!',

                    /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
                    contentType: ContentType.success,
                    // to configure for material banner
                    inMaterialBanner: true,
                  ),
                  actions: [SizedBox.shrink()],
                );

                ScaffoldMessenger.of(context)
                  ..hideCurrentMaterialBanner()
                  ..showMaterialBanner(materialBanner);
              },
            ),
          ],
        ),
      ),
    );
  }
}
```