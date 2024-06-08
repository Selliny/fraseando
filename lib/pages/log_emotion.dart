import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'emotions_provider.dart';
import 'emotions.dart';

class LogEmotionScreen extends StatefulWidget {
  @override
  _LogEmotionScreenState createState() => _LogEmotionScreenState();
}

class _LogEmotionScreenState extends State<LogEmotionScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emotionController = TextEditingController();
  int _selectedIntensity = 5;

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
    10: '🤩',
    11: '😡',
    12: '😢',
  };

  void _saveForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      Provider.of<EmotionProvider>(context, listen: false).addEmotion(
        Emotion(
            date: DateTime.now(),
            type: _emotionController.text,
            intensity: _selectedIntensity),
      );
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Emoção'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade100, Colors.blue.shade300],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Wrap(
                spacing: 10,
                children: intensityEmojiMap.entries.map((entry) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIntensity = entry.key;
                      });
                    },
                    child: Text(
                      entry.value,
                      style: TextStyle(
                          fontSize: 30,
                          color: _selectedIntensity == entry.key
                              ? Colors.blue
                              : Colors.black),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emotionController,
                decoration: InputDecoration(
                  labelText: 'O que você está sentindo?',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira uma emoção';
                  }
                  return null;
                },
                onSaved: (value) {},
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveForm,
                style: ElevatedButton.styleFrom(
                  shadowColor: Colors.grey,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text('Salvar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
