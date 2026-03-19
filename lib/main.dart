import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Map<String, String>> stories = [
    {
      "title": "My First Story",
      "content": "Yeh meri pehli app ki story hai"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("My App")),
        body: ListView.builder(
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(stories[index]["title"]!),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      title: stories[index]["title"]!,
                      content: stories[index]["content"]!,
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final String title;
  final String content;

  DetailScreen({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Text(content),
      ),
    );
  }
}
