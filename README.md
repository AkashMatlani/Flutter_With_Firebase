# Flutter With Firebase

## Overview

This project is a simple Notes Application built using **Flutter** and **Firebase Firestore**.

The purpose of this project is to demonstrate:

- Understanding of Flutter UI development
- Firebase integration
- Real-time cloud database updates
- Ability to teach core mobile development concepts

---

## Technologies Used

- Flutter (UI Framework)
- Dart (Programming Language)
- Firebase Core
- Cloud Firestore (Real-time Database)
- Android Emulator

---

## Features

- Add a new note
- View notes in real-time
- Delete notes
- Automatic cloud synchronization with Firestore

---

## Project Structure

lib/
- main.dart

The application uses:
- StatefulWidget
- StreamBuilder
- FirebaseFirestore instance
  
---

## How It Works

1. The user enters a note.
2. The note is stored in Firebase Firestore.
3. Firestore sends real-time updates to the app.
4. The app updates automatically using StreamBuilder.

---

## Firebase Setup

1. Create Firebase project
2. Enable Firestore Database
3. Add Android app
4. Download `google-services.json`
5. Place it inside:
   android/app/
6. Add Firebase dependencies:
   - firebase_core
   - cloud_firestore

---

## Key Concepts Demonstrated

- Widgets and UI layout
- State management
- Asynchronous programming
- Real-time databases
- Frontend to backend communication
  
