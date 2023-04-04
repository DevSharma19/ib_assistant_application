import 'package:flutter/material.dart';
import 'package:ib_assistant_application/note_taking_page.dart';
import 'package:ib_assistant_application/schedule_page.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final stt.SpeechToText _speech = stt.SpeechToText();
  bool _isListening = false;
  String _content = '';

  @override
  void initState() {
    super.initState();
    _initializeSpeechRecognizer();
  }

  void _initializeSpeechRecognizer() async {
    bool isAvailable = await _speech.initialize(
      onStatus: (status) => print('onStatus: $status'),
      onError: (error) => print('onError: $error'),
    );
    if (isAvailable) {
      print('Speech recognizer initialized');
    } else {
      print('Error initializing speech recognizer');
    }
  }

  void _startListening() {
    setState(() {
      _isListening = true;
    });
    _speech.listen(
      onResult: (result) => setState(() {
        _content = result.recognizedWords;
      }),
    );
  }

  void _stopListening() {
    setState(() {
      _isListening = false;
      _speech.stop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IB Assistant'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                child: const Icon(Icons.edit),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePage(),
                    ),
                  );
                },
                child: const Icon(Icons.calendar_today),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: navigate to study resources screen
                },
                child: const Icon(Icons.book),
              ),
              ElevatedButton(
                onPressed: () {
                  // TODO: navigate to settings screen
                },
                child: const Icon(Icons.settings),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Center(
              child: Text(_content),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_isListening) {
            _stopListening();
          } else {
            _startListening();
          }
        },
        child: const Icon(Icons.mic),
        backgroundColor:
            _isListening ? Colors.green.shade400 : Colors.blue.shade400,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
