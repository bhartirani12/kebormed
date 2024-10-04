# kebormed

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Installation

Clone the repository:
git clone https://github.com/bhartirani12/kebormed.git


## Navigate into the project directory: 
cd kebormed


## Install dependencies:
flutter pub get

## How to Run
Run the app using the following command: 
flutter run
To run on a specific device or simulator, ensure your device is connected or a simulator is running, then run:
flutter run -d <device_id>


## State Management
This app uses the flutter_bloc library for managing the application's state. BLoC (Business Logic Component) is implemented to separate the business logic from UI, ensuring maintainable code.
LoginBloc: Manages state for the login page.
HomeBloc: Handles fetching and refreshing the list of users.
UserDetailBloc: Manages state for the user detail page.


## UI/UX
The app follows Material Design guidelines for UI components.
It is responsive across different screen sizes and resolutions.
Transitions between screens include animations to enhance user experience.


## Error Handling
Robust error handling is implemented throughout the app. In case of invalid credentials, API failures, or connection issues, appropriate error messages are displayed to the user.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

