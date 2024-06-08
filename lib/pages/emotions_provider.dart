import 'package:flutter/material.dart';
import 'emotions.dart';

class EmotionProvider with ChangeNotifier {
  List<Emotion> _emotions = [];
  List<Emotion> get emotions => _emotions;

  void addEmotion(Emotion emotion) {
    _emotions.add(emotion);
    notifyListeners();
  }
}
