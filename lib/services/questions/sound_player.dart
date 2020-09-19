import 'package:audioplayers/audio_cache.dart';

class SoundPlayer {
  static final _player = AudioCache(prefix: 'audio/');

  static Future<void> successSound() async {
    await _player.play("success.mp3");
  }

  static Future<void> failSound() async {
    await _player.play("fail.mp3");
  }
}
