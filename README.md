# Chat Application

A real-time chat application built using **Flutter** with **Firebase** as the backend and **BLoC** for state management. This app allows users to send and receive messages, create chat rooms, and manage conversations with other users in real-time.

## Features

- **Real-Time Messaging**: Send and receive messages in real-time using Firebase Firestore.
- **User Authentication**: Secure user login and registration with Firebase Authentication (Email/Password or Google Sign-In).
- **Chat Rooms**: Create, join, and manage chat rooms for group discussions.
- **Message History**: Store and display message history in each chat room.
- **Push Notifications**: Receive notifications when a new message is sent to a chat room.
- **BLoC Architecture**: State management using BLoC to separate UI from business logic for better scalability and maintenance.

## Technologies Used

- **Flutter**: The mobile framework used to build the app.
- **Dart**: Programming language for development.
- **Firebase**: For authentication, real-time messaging (Firestore), and push notifications.
- **BLoC**: Business Logic Component for state management.
- **Firebase Cloud Messaging (FCM)**: For push notifications.

## Installation

### Prerequisites

Before running the project, make sure you have the following installed:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart) (included with Flutter)
- An IDE like **Android Studio** or **VSCode** for Flutter development.

### Firebase Setup

1. **Create a Firebase Project**:
   - Go to the [Firebase Console](https://console.firebase.google.com/).
   - Create a new Firebase project and link it to your Flutter project (for both Android and iOS).
   - Add your **google-services.json** (for Android) and **GoogleService-Info.plist** (for iOS) to your project.

2. **Enable Firebase Authentication**:
   - In Firebase, enable **Email/Password Authentication** or **Google Sign-In** for user login.

3. **Enable Firestore**:
   - Set up **Firestore** to store and manage chat rooms, messages, and user profiles.

4. **Enable Firebase Cloud Messaging (FCM)**:
   - Set up **FCM** for sending push notifications when new messages are received.

### Steps to Run the Project Locally

1. **Clone the repository**:
    ```bash
    git clone https://github.com/HossamAhmed954074/chat_app.git
    ```

2. **Navigate to the project directory**:
    ```bash
    cd chat_app
    ```

3. **Install dependencies**:
    ```bash
    flutter pub get
    ```

4. **Set up Firebase**:
    - Follow the Firebase setup steps mentioned above and add the necessary configuration files (**google-services.json** and **GoogleService-Info.plist**) to the project.

5. **Run the app**:
    - For **Android**:
      ```bash
      flutter run
      ```
    - For **iOS** (on macOS):
      ```bash
      flutter run
      ```

## Usage

Once the app is running:

- **User Authentication**: Sign in or register using Firebase Authentication (Email/Password or Google Sign-In).
- **Create/Join Chat Rooms**: Users can create new chat rooms or join existing ones.
- **Send and Receive Messages**: Send messages to the chat room and receive real-time updates on new messages.
- **Push Notifications**: Get notified when someone sends a message to your chat room.

The app provides a simple and intuitive UI for real-time communication between users.

## BLoC Architecture

This app uses the **BLoC** (Business Logic Component) pattern for efficient state management. This ensures that the app’s business logic is separate from the UI, leading to better scalability and maintainability.

### Key BLoC Components:

- **Authentication Bloc**: Manages the authentication state (sign in, sign out).
- **Chat Bloc**: Manages the state of chat rooms, messages, and real-time updates.
- **Message Bloc**: Handles message sending and receiving.
- **Notification Bloc**: Handles the push notifications for new messages.

## Contributing

We welcome contributions to improve this app! If you'd like to help out, please fork the repository, make your changes, and submit a pull request.

### How to Contribute:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Make your changes and commit them (`git commit -m 'Add new feature'`).
4. Push to your fork (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for more details.

## Contact

For any questions or feedback, feel free to contact me:

- Email: eltohamehossam@gmail.com
- LinkedIn: www.linkedin.com/in/hossam-ahmed-ab4987248


---

Thank you for checking out **Chat Application**! We hope this app helps you stay connected with friends, family, and colleagues in real-time.

