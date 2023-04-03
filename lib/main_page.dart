import 'package:flutter/material.dart';
import 'package:ib_assistant_application/note_taking_page.dart';
import 'package:ib_assistant_application/schedule_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IB Assistant'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NoteTakingPage(),
                  ),
                );
              },
              child: const Text('Note Taking'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchedulePage(),
                  ),
                );
              },
              child: const Text('Schedule & Deadlines'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: navigate to study resources screen
              },
              child: const Text('Study Resources'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // TODO: navigate to settings screen
              },
              child: const Text('Settings'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: implement voice command functionality
        },
        child: const Icon(Icons.mic),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
