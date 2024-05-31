import 'package:festiveapp_studio/common/common_back_button.dart';
import 'package:festiveapp_studio/common/testStyle.dart';
import 'package:festiveapp_studio/screen/tutorials/tutorials_controller.dart';
import 'package:festiveapp_studio/utils/app_colors.dart';
import 'package:festiveapp_studio/utils/string_res.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatelessWidget {
  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                CommonBackButton(
                  onTap: () {
                    Get.back();
                  },
                ),
                const Spacer(),
                Text(
                  StringRes.tutorial,
                  style: boldFontStyle(color: AppColors.blackColor, size: 18),
                ),
                const Spacer(),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildVideoItem('How to create logo?', videoController),
                  _buildVideoItem('How to choose frame?', videoController),
                  _buildVideoItem('How to add brand Details?', videoController),
                  _buildVideoItem(
                      'How to download & share post?', videoController),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, VideoController controller) {
    return Obx(() => Column(
          children: [
            ListTile(
              title: Text(title),
            ),
            controller.videoPlayerController!.value.isInitialized
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController!.value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController!),
                      ),
                      IconButton(
                              icon: Icon(
                                  controller.isPlaying.value
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 64,
                                  color: AppColors.white),
                              onPressed: () {
                                controller.playPause();
                              },
                            ),
                    ],
                  )
                : Container(
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.detailsTitle, // Adjust color as needed
                    ),
                    child: Center(
                      child: IconButton(
                        icon: Icon(
                            controller.isPlaying.value
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            size: 64,
                            color: Colors.white),
                        onPressed: () {
                          controller.playPause();
                        },
                      ),
                    ),
                  ),
          ],
        ));
  }
}
