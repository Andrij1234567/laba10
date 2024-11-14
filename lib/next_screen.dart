import 'package:flutter/material.dart';

class PreviewScreen extends StatelessWidget {
  final String text;
  final double fontSize;

  const PreviewScreen({required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preview'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context, null);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text,
              style: TextStyle(fontSize: fontSize),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'ok');
                  },
                  child: Text('Ok'),
                ),
                SizedBox(width: 20),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context, 'cancel');
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
