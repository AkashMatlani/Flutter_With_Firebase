// Import Firebase core (needed to initialize Firebase)
import 'package:firebase_core/firebase_core.dart' show Firebase;
// Import Flutter UI package
import 'package:flutter/material.dart';

/*Import NotesPage*/
import 'notes_page.dart';

// Main function – Entry point of the application
void main()  async{
  // Ensures Flutter engine is fully initialized before using async code
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize Firebase before running the app
  await Firebase.initializeApp();
  // Run the main app widget
  runApp(const MyApp());
}

// Root widget of the application
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NotesPage(),
    );
  }
}

