import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emotions_provider.dart';
import 'Emoji_ranting.dart';
import 'log_emotion.dart';

void main() {
  runApp(Emojimain());
}

class Emojimain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmotionProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Regulador de Emoções',
        theme: ThemeData(primarySwatch: Colors.lightBlue),
        home: EmojiRatingBar(),
        routes: {
          '/log-emotion': (context) => LogEmotionScreen(),
        },
      ),
    );
  }
}
