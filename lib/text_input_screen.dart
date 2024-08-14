import 'package:flutter/material.dart';

// https://www.youtube.com/watch?v=d0uith-LE3o

class TextInputScreen extends StatefulWidget {
  const TextInputScreen({super.key});

  @override
  // _TextInputScreenState createState() => _TextInputScreenState();
  // Creates an error: Invalid use of a private type in a public API.
  State<TextInputScreen> createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextEditingController _controllerUserName = TextEditingController();
  final TextEditingController _controllerPassWord = TextEditingController();

  String _userName = "";
  String _passWord = "";
  String _message = 'Hello, World!';

  void _submitStrings() {
    setState(() {
      _userName = _controllerUserName.text;
      _passWord = _controllerPassWord.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign in'),
        centerTitle: true,
        leading: IconButton(
            icon: const Icon(Icons.menu), // Replace with your desired icon
            onPressed: () {
              setState(() {
                // Update the message when the icon is pressed
                _message = 'Menu icon pressed!';
              });
            },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search), // Icon on the right
            onPressed: () {
              setState(() {
                // Update the message when the icon is pressed
                _message = 'Search icon pressed!';
              });
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerUserName,
              decoration: const InputDecoration(
                labelText: 'Enter user name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controllerPassWord,
              decoration: const InputDecoration(
                labelText: 'Enter password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitStrings,
              child: const Text('Sign in'),
            ),
            const SizedBox(height: 20),
            Text(
              'User name: $_userName',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Password: $_passWord',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              _message,
              style: const TextStyle(fontSize: 28),
            ),
          ],
        ),
      ),
    );
  }
}
