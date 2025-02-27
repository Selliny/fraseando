import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:youtube_explode_dart/youtube_explode_dart.dart';
import 'package:fraseando/components/customAppBar.dart';
import 'package:fraseando/components/customDrawer.dart';
import 'package:fraseando/components/navigateToPage.dart';
import '../../mainPage.dart';
import '../alertas.dart';

class ComidasPage extends StatefulWidget {
  const ComidasPage({super.key});

  @override
  State<ComidasPage> createState() => _ComidasPageState();
}

class _ComidasPageState extends State<ComidasPage> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  final YoutubeExplode _youtubeExplode = YoutubeExplode();

  final List<String> _videoIds = [
    'QhgO6z0_y3Q',
    'aBcDeFgHiJk',
    'XyZ12345678',
    'lMnOpQrStUv',
  ];

  @override
  void dispose() {
    _audioPlayer.dispose();
    _youtubeExplode.close();
    super.dispose();
  }

  Future<void> _playAudio(int index) async {
    final video = await _youtubeExplode.videos.get(_videoIds[index]);
    final manifest =
        await _youtubeExplode.videos.streamsClient.getManifest(video.id);
    final audioStreamInfo = manifest.audioOnly.withHighestBitrate();
    final audioStreamUrl = audioStreamInfo.url;

    await _audioPlayer.setUrl(audioStreamUrl.toString());
    _audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Wrap(
                spacing: 20,
                runSpacing: 20,
                children: [
                  CustomClipRRect(
                    icon: Icons.fastfood,
                    onPressed: () => _playAudio(0),
                    text: "Hamburguer",
                  ),
                  CustomClipRRect(
                    icon: Icons.local_drink,
                    onPressed: () => _playAudio(1),
                    text: "Água",
                  ),
                  CustomClipRRect(
                    icon: Icons.cake,
                    onPressed: () => _playAudio(2),
                    text: "Bolo",
                  ),
                  CustomClipRRect(
                    icon: Icons.local_pizza,
                    onPressed: () => _playAudio(3),
                    text: "Pizza",
                  ),
                ],
              ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomAppBar(
        height: 60,
        color: Colors.blue,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.add_circle,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.person,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const MyHomePage());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.settings,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.notifications,
                      color: Color.fromARGB(255, 233, 229, 229)),
                  onPressed: () {
                    navigateToPage(context, const AlertasFraseando());
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipRRect extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String text;

  const CustomClipRRect({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        height: 250,
        width: 250,
        color: Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              icon: Icon(
                icon,
                size: 150,
                color: Colors.black,
              ),
              onPressed: onPressed,
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
