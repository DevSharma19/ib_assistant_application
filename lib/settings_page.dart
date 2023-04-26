import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isOfflineModeEnabled = false;
  bool _isDataCollectionEnabled = true;
  bool _isNotificationEnabled = true;
  String _selectedVoice = 'Default';
  String _selectedTheme = 'Light';

  List<String> _availableVoices = [
    'Default',
    'Voice 1',
    'Voice 2',
    'Voice 3',
  ];

  List<String> _availableThemes = [
    'Light',
    'Dark',
    'Blue',
    'Green',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          SwitchListTile(
            title: Text('Offline Mode'),
            subtitle: Text('Use voice assistant offline'),
            value: _isOfflineModeEnabled,
            onChanged: (value) {
              setState(() {
                _isOfflineModeEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Data Collection'),
            subtitle: Text('Enable data collection for app improvement'),
            value: _isDataCollectionEnabled,
            onChanged: (value) {
              setState(() {
                _isDataCollectionEnabled = value;
              });
            },
          ),
          SwitchListTile(
            title: Text('Notifications'),
            subtitle: Text('Enable app notifications'),
            value: _isNotificationEnabled,
            onChanged: (value) {
              setState(() {
                _isNotificationEnabled = value;
              });
            },
          ),
          ListTile(
            title: Text('Voice Assistant Voice'),
            subtitle: Text('Select voice for voice assistant'),
            trailing: DropdownButton<String>(
              value: _selectedVoice,
              onChanged: (newValue) {
                setState(() {
                  _selectedVoice = newValue!;
                });
              },
              items: _availableVoices.map<DropdownMenuItem<String>>(
                (voice) {
                  return DropdownMenuItem<String>(
                    value: voice,
                    child: Text(voice),
                  );
                },
              ).toList(),
            ),
          ),
          ListTile(
            title: Text('Theme Selection'),
            subtitle: Text('Select app theme'),
            trailing: DropdownButton<String>(
              value: _selectedTheme,
              onChanged: (newValue) {
                setState(() {
                  _selectedTheme = newValue!;
                });
              },
              items: _availableThemes.map<DropdownMenuItem<String>>(
                (theme) {
                  return DropdownMenuItem<String>(
                    value: theme,
                    child: Text(theme),
                  );
                },
              ).toList(),
            ),
          ),
          ListTile(
            title: Text('Personalization'),
            subtitle: Text('Set custom wake word or trigger phrase'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Navigate to personalization settings page
            },
          ),
          ListTile(
            title: Text('History and Privacy Settings'),
            subtitle:
                Text('Manage voice assistant command history and data privacy'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Navigate to history and privacy settings page
            },
          ),
          ListTile(
            title: Text('Help and Tutorials'),
            subtitle: Text('Access app tutorials and FAQs'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Navigate to help
            },
          ),
          ListTile(
            title: Text('Feedback and Contact'),
            subtitle: Text('Provide feedback or contact support'),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () {
              // TODO: Navigate to feedback and contact page
            },
          ),
        ],
      ),
    );
  }
}
