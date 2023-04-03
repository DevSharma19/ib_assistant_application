import 'package:flutter/material.dart';

class NoteTakingPage extends StatelessWidget {
  const NoteTakingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Note Taking'),
      ),
      body: ListView.builder(
        itemCount: 15, // replace with actual number of notes
        itemBuilder: (context, index) {
          return Card(
            color: Colors.grey.shade300, // add a slight background color
            margin: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // add a margin between the cards
            child: InkWell(
              onTap: () {
                // TODO: navigate to note detail screen
              },
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Note Title',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Created on: 01-01-2022',
                      style: Theme.of(context).textTheme.caption,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Note content preview...',
                      style: Theme.of(context).textTheme.bodyText2,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: navigate to new note screen
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
