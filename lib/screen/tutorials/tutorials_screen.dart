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

   VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.backgroundCard,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 40,
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
                Visibility(
                  visible: false,
                  maintainSize: true,
                  maintainAnimation: true,
                  maintainState: true,
                  child: CommonBackButton(
                    onTap: () {

                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildVideoItem('How to create logo?', videoController,0),
                  _buildVideoItem('How to choose frame?', videoController,1),
                  _buildVideoItem('How to add brand Details?', videoController,2),
                  _buildVideoItem(
                      'How to download & share post?', videoController,3),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVideoItem(String title, VideoController controller,index) {
    return Obx(() => Column(
          children: [
            ListTile(
              title: Text(title),
            ),
            controller.videoPlayerController![index].value.isInitialized
                ? Stack(
                    alignment: Alignment.center,
                    children: [
                      AspectRatio(
                        aspectRatio:
                            controller.videoPlayerController![index].value.aspectRatio,
                        child: VideoPlayer(controller.videoPlayerController![index]),
                      ),
                      IconButton(
                              icon: Icon(
                                  controller.isPlaying[index].value
                                      ? Icons.pause_circle_outline
                                      : Icons.play_circle_outline,
                                  size: 64,
                                  color: AppColors.white),
                              onPressed: () {
                                controller.playPause(index);
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
                            controller.isPlaying[index].value
                                ? Icons.pause_circle_outline
                                : Icons.play_circle_outline,
                            size: 64,
                            color: Colors.white),
                        onPressed: () {
                          controller.playPause(index);
                        },
                      ),
                    ),
                  ),
          ],
        ));
  }
}
