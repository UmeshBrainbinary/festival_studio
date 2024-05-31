import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  VideoPlayerController? videoPlayerController;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayer();
  }
  Future<void> initializeVideoPlayer() async {
    videoPlayerController = VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'));

    try {
      await videoPlayerController!.initialize();
      update();
    } catch (e) {
      print('Error initializing video player: $e');
    }
  }

  @override
  void onClose() {
    videoPlayerController!.dispose();
    super.onClose();
  }

  void playPause() {
    if (videoPlayerController!.value.isPlaying) {
      videoPlayerController!.pause();
      isPlaying(false);
    } else {
      videoPlayerController!.play();
      isPlaying(true);
    }
  }
}
