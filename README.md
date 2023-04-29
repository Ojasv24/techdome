
# ToDo App with Flutter, Firebase, and Riverpod 

This is a simple ToDo app built using Flutter and Firebase technologies, with Riverpod for state management and dependency injection.

## Demo

- Download the apk from https://github.com/Ojasv24/techdome/raw/master/app-release.apk or use the web app at https://techdome-e35e6.web.app/
- Either use any email and password for sign up or use the following crendtials
  - abc@gmai.com
  - 12345678

- To add any ToDo enter the description to the bottom text box and click on the plus button beside it
- To update the ToDo tap on the text to inplace update the text
- To Mark it as completed click on the check box
- TO delete any ToDo click on bin Icon

## Features

- User authentication using Firebase Authentication
- User data stored in Firestore
- Ability to create, read, update, and delete ToDo items
- State management using Riverpod
- Dependency injection using Riverpod


## Getting Started

To get started with this project, follow these steps:

- Clone the repository: git clone https://github.com/your-username/todo-app.git
- Install dependencies: flutter pub get
- Create a new Firebase project and add an Android and/or iOS app to it.
- Download the google-services.json and/or GoogleService-Info.plist file(s) from Firebase and add them to the android/app and/or ios/Runner directories of your project.
- Enable Firebase Authentication and Firestore in your Firebase project.
- Update the Firebase configuration in the lib/services/- firebase_service.dart file.
- Run the app: flutter run
