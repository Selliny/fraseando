import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emotions_provider.dart';

class EmotionChart extends StatelessWidget {
  final Map<int, String> intensityEmojiMap = {
    1: '😞',
    2: '😟',
    3: '😔',
    4: '😕',
    5: '😐',
    6: '🙂',
    7: '😊',
    8: '😀',
    9: '😁',
    10: '🤩'
  };

  @override
  Widget build(BuildContext context) {
    final emotionData = Provider.of<EmotionProvider>(context).emotions;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: emotionData.length,
          itemBuilder: (ctx, index) {
            final emotion = emotionData[index];
            return ListTile(
              leading: Text(
                intensityEmojiMap[emotion.intensity] ?? '',
                style: TextStyle(fontSize: 30),
              ),
              title: Text(emotion.type, style: TextStyle(fontSize: 20)),
              subtitle: Text(
                '${emotion.date.day}/${emotion.date.month}/${emotion.date.year}',
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        ),
      ),
    );
  }
}
