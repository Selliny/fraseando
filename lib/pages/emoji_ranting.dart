import 'package:emotion_pages/emotion_chart.dart';
import 'package:flutter/material.dart';
import 'log_emotion.dart'; // Importação atualizada

class EmojiRatingBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Emoções'),
        backgroundColor: Colors.lightBlue,
      ),
      body: EmotionChart(), // Widget atualizado
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/log-emotion');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
