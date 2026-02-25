import 'package:flutter/material.dart';
// Import Cloud Firestore for database operations
import 'package:cloud_firestore/cloud_firestore.dart';

/* NotesPage is a StatefulWidget because
the UI updates when notes are added or removed */
class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  // Controller to read text from TextField
  final TextEditingController _controller = TextEditingController();
  /*  Reference to the Firestore collection named "notes" */
  final CollectionReference notesCollection =
  FirebaseFirestore.instance.collection('notes');
  void addNote() async {
    if (_controller.text.isNotEmpty) {
      await notesCollection.add({
        // Store the note text
        'text': _controller.text,
        // Store server timestamp
        'timestamp': FieldValue.serverTimestamp(),
      });
      // Clear the input field after adding note
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // app bar for set Title
    appBar: AppBar(title: const Text("Notes App")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Text input field for entering notes
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: "Enter a note",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            // Button to add note
            ElevatedButton(
              onPressed: addNote,
              child: const Text("Add Note"),
            ),
            const SizedBox(height: 20),
            // Expanded allows ListView to take remaining space
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream: notesCollection.orderBy('timestamp', descending: true).snapshots(),
                builder: (context, snapshot) {
                  // Show loading indicator while loading data
                  if (!snapshot.hasData) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  // Get notes from snapshot
                  final notesDocs = snapshot.data!.docs;
                  // Build list view of notes
                  return ListView.builder(
                    itemCount: notesDocs.length,
                    itemBuilder: (context, index) {
                      // Access single notes
                      final doc = notesDocs[index];
                      return ListTile(
                        // Display note text
                      title: Text(doc['text']),
                        // Delete button
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          //click event to delete note
                          onPressed: () {
                            notesCollection.doc(doc.id).delete();
                          },
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}