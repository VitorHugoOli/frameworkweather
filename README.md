# Framework Weather Challenge

Hello, this is a showcase app, that I made to show my knowledge in Flutter, for the Framework Weather
challenge.
Ins this app we can see some weather information, like the temperature, humidity and wind speed of
the Belo Horizonte city.

## How to run

The project can be expanded to have multiple entrypoints, with different environments.
For now, just have the production entrypoint. Since this is a showcase app.

`flutter run -t ./lib/entrypoint/production.dart`

## How to test

`flutter test`

## How to build

`flutter build apk --release -t ./lib/entrypoint/production.dart`

## Folder and file structure

In this project we are using the MVVM architecture, with the mobx state management. So in the lib folder we have:
- entrypoint: The entrypoint of the app, for now just the production entrypoint.
- envs: The environments of the app, for now just the production environment.
- extensions: The extensions of the app, that are used to extend some classes, like String, DateTime and etc...
- model: The models of the app, that are used to represent the data.
- services: The services of the app, that are used to fetch data from the internet, or local db.
- view: The view of the app, that contains the pages, components and widgets.
    - components: The components of the app, that can be used in multiple places. Or is more generic.
    - pages: The pages of the app, that are used to show the data to the user.
    - widgets: The widgets of the app, that are used to show the data to the user.
- viewmodel: The viewmodel of the app, that are used to control the state of the app.
- main.dart: The main file of the app, that is called by the entrypoint. In there we have the
  MaterialApp with the routes and the theme of the app.

# Technical debts

- [ ] Flutter analyze 3 info errors
