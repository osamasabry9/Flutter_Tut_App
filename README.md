# Tut App using : ( Clean architecture with MVVM ).

 This project is powered by FLutter **3.0.5** and dart **2.17.6**.

The main packages used in the project:

```yaml
dependencies:
  cupertino_icons: ^1.0.2
  flutter_svg: ^1.1.4
  retrofit: ^3.0.1+1
  analyzer: ^5.2.0
  dio: ^4.0.6
  dartz: ^0.10.1
  internet_connection_checker: ^1.0.0+1
  pretty_dio_logger: ^1.2.0-beta-1
  shared_preferences: ^2.0.15
  freezed_annotation: ^2.2.0
  json_annotation: ^4.5.0
  get_it: ^7.2.0
  lottie: ^2.1.0
  image_picker: ^0.8.6
  intl_phone_field: ^3.1.0
  rxdart: ^0.27.7
  carousel_slider: ^4.2.1
  flutter_phoenix: ^1.1.0
  easy_localization: ^3.0.1

dev_dependencies:
  flutter_lints: ^2.0.0

  retrofit_generator: ^4.0.1
  build_runner: ^2.1.11
  freezed: ^2.0.4
  json_serializable: ^6.2.0
```

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
git clone https://github.com/osamasabry9/Flutter_Tut_App.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `inject` library that works with code generation, execute the following command to generate files:

```
flutter packages pub run build_runner build --delete-conflicting-outputs
```

or watch command in order to keep the source code synced automatically:

```
flutter packages pub run build_runner watch
```
### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
```

Here is the folder structure we have been using in this project

```
lib/app/
       |- app_prefs/
       |- app/
       |- constant/
       |- di/
       |- extension/
       |- function/
lib/core/
       |- common/
       |- error/
       |- state_renderer/
       |- utils/
            |- assets
            |- colors
            |- constants
            |- fonts
            |- language
            |- routes
            |- strings
            |- styles
            |- themes
            |- values
            
            
lib/data/
       |- data_source/
       |- mapper/
       |- network/
       |- repository/
       |- responses/

lib/domain/
       |- model/
       |- repository/
       |- usecase/

lib/presentation/
       |- base/
       |- splash/
       |- onboarding/
       |- login/
       |- register/
       |- forgot_password/
       |- main/
          |- pages/
                |- home/
                |- notifications/
                |- search/
                |- settings/
          |- main_view
       |- store_details/
lib/main
```

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
