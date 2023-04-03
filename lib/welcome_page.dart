import 'package:flutter/material.dart';

import 'main_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 120),
            const SizedBox(height: 20),
            Text(
              'IB Assistant',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome to IB Assistant, the app that helps you prepare for your IB exams.',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MainPage(),
                  ),
                );
              },
              child: const Text('Get started'),
            ),
          ],
        ),
      ),
    );
  }
}
