// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController extends GetxController {
  //VideoPlayerController? videoPlayerController;

  List<VideoPlayerController>? videoPlayerController;
  List<RxBool> isPlaying = [];

  @override
  void onInit() {
    super.onInit();
    initializeVideoPlayer();
  }
  Future<void> initializeVideoPlayer() async {
    videoPlayerController = List.generate(4, (index)=> VideoPlayerController.networkUrl(
        Uri.parse('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')));
isPlaying = List.generate(4, (index)=>false.obs);
    try {
      videoPlayerController!.forEach((e) async {
      await e.initialize();

      });
      update();
    } catch (e) {
      if (kDebugMode) {
        print('Error initializing video player: $e');
      }
    }
  }

  @override
  void onClose() {
    videoPlayerController!.forEach((e) async {
      await e.dispose();

    });
    super.onClose();
  }

  void playPause(index) {
    if (videoPlayerController![index].value.isPlaying) {
      videoPlayerController![index].pause();
      isPlaying[index].value= (false);
    } else {
      videoPlayerController![index].play();
      isPlaying[index].value= (true);
    }
  }
}
