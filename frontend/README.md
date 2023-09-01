# NTTGreen

### Code structure
Kindly follow this code structure

- lib/
    - main.dart
    - screens/
        - authentication/
            - authentication_page.dart
            - registration_page.dart
        - home/
            - home_page.dart
            - widgets/
                - home_card.dart
        - profile/
            - profile_page.dart
        - settings/
            - settings_page.dart
    - artifacts
    - models/
        - user_model.dart
    - services/
        - authentication_service.dart
        - api_service.dart
    - utils/
        - constants.dart
        - helpers.dart
    - widgets/
        - app_drawer.dart
        - loading_spinner.dart
- test

android/ and ios/: These directories contain the native Android and
iOS code, respectively. Flutter integrates with native platforms to
build the final application.

lib/: This is where most of your Dart code will reside.

lib/main.dart: The entry point of your application. This is where
you'll define the main() function and initialize your app.

lib/screens/: This directory holds all the screens or pages of your application.

lib/artifacts/: This is the directory for any artifacts, images, or static files

lib/models/: The directory to define data models used in your application.

lib/services/: This is where you can place services, such as
authentication or API services, to handle specific functionalities.

lib/utils/: Utility classes, constants, or helper functions can be placed here.

lib/widgets/: Custom widgets that can be reused across different screens.

test/: Unit tests for your application.

pubspec.yaml: The configuration file where you define your project's
dependencies and other configurations.

README.md: Documentation for your project.