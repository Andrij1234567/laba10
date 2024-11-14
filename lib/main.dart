import 'package:flutter/material.dart';
import 'package:lab10/next_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextInputScreen(),
    );
  }
}

class TextInputScreen extends StatefulWidget {
  @override
  _TextInputScreenState createState() => _TextInputScreenState();
}

class _TextInputScreenState extends State<TextInputScreen> {
  final TextEditingController _textController = TextEditingController();
  double _fontSize = 20.0;

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [Image.network(
              'https://emojiisland.com/cdn/shop/products/Robot_Emoji_Icon_abe1111a-1293-4668-bdf9-9ceb05cff58e_large.png?v=1571606090',
              width: 50,
              height: 50,
            ),
              SizedBox(width: 10),
               Text(message,style: TextStyle(fontSize: 20),),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text previewer')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter text to preview'),
            ),
            SizedBox(height: 20),
            Text('Font size: ${_fontSize.toInt()}'),
            Slider(
              value: _fontSize,
              min: 10,
              max: 50,
              onChanged: (value) {
                setState(() {
                  _fontSize = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PreviewScreen(
                      text: _textController.text,
                      fontSize: _fontSize,
                    ),
                  ),
                );

                if (result == 'ok') {
                  _showDialog('Cool!');
                } else if (result == 'cancel') {
                  _showDialog('Let’s try something else');
                } else {
                  _showDialog('Don’t know what to say');
                }
              },
              child: Text('Preview'),
            ),
          ],
        ),
      ),
    );
  }
}
