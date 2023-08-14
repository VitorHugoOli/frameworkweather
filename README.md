# frameworkweather



## How to run

The project can be expanded to have multiple entrypoints, with different environments.
For now, just have the production entrypoint. Since this is a showcase app.

`flutter run -t ./lib/entrypoint/production.dart`

## How to test

`flutter test`

## How to build

`flutter build apk --release -t ./lib/entrypoint/production.dart`
