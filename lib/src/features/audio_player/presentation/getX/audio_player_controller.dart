import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import '../../domain/entities/entities.dart';

class AudioController extends GetxController {
  final player = AudioPlayer();
  var isPlaying = false.obs;
  var currentIndex = 0.obs;

  final List<AudioModel> audioList = [
    AudioModel(
      title: "Track 1",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    ),
    AudioModel(
      title: "Track 2",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-2.mp3",
    ),
    AudioModel(
      title: "Track 3",
      url: "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-3.mp3",
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    configureAudioSession();
  }

  Future<void> configureAudioSession() async {
    await player.setAudioSource(ConcatenatingAudioSource(
      children: audioList
          .map((audio) => AudioSource.uri(Uri.parse(audio.url)))
          .toList(),
    ));
  }

  void playAudio(int index) async {
    currentIndex.value = index;
    await player.seek(Duration.zero, index: index);
    await player.play();
    isPlaying.value = true;

    player.playerStateStream.listen((state) {
      isPlaying.value = state.playing;
    });
  }

  void pauseAudio() async {
    await player.pause();
    isPlaying.value = false;
  }

  @override
  void onClose() {
    player.dispose();
    super.onClose();
  }
}
