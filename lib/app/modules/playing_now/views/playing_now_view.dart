import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:podcast_ba/app/common/colors.dart';
import 'package:podcast_ba/app/data/audio/audio_service.dart';

import '../controllers/playing_now_controller.dart';

class PlayingNowView extends StatelessWidget {
  PlayingNowController playingNowController = Get.put(PlayingNowController());
  PlayerController playerController = Get.put(PlayerController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Obx(() {
              return Container(
                width: double.infinity,
                height: 200,
                child: Image.network(
                  playerController
                      .streams[playingNowController.selectedIndex.value].image!,
                  fit: BoxFit.contain,
                ),
              );
            }),

            const SizedBox(height: 20),
            Obx(() {
              return Text(
                playerController
                    .streams[playingNowController.selectedIndex.value].title!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              );
            }),
            const SizedBox(height: 10),
            Obx(() {
              return Text(
                playerController
                    .streams[playingNowController.selectedIndex.value]
                    .language!,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              );
            }),
            const Expanded(child: SizedBox()),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: primaryColor,
                    blurRadius: 15,
                    offset: Offset(0, 0),
                    spreadRadius: 30,
                  ),
                ],
              ),
              child: Obx(
                () => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15, left: 15),
                      child: Row(
                        children: [
                          Text(
                            playerController.position.value.timeFormat,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Expanded(
                            child: Slider(
                                activeColor: pinkColor,
                                inactiveColor: const Color(0xFFEFEFEF),
                                value: playerController.position.value.inSeconds
                                    .toDouble(),
                                min: 0.0,
                                max: playerController.duration.value.inSeconds
                                        .toDouble() +
                                    1.0,
                                onChanged: (double value) {
                                  playerController.setPositionValue = value;
                                }),
                          ),
                          Text(
                            playerController.duration.value.timeFormat,
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10, left: 10, top: 5, bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              playerController.back();
                            },
                            iconSize: 35,
                            icon: const Icon(
                              Icons.skip_previous,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              (playerController.isPlaying)
                                  ? playerController.pause
                                  : playerController.play;
                            },
                            iconSize: 60,
                            icon: Icon(
                              (playerController.isPlaying)
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                playerController.next();
                              },
                              iconSize: 35,
                              icon: const Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     IconButton(
            //       icon: Icon(Icons.skip_previous),
            //       onPressed: playerController.back,
            //     ),
            //     Obx(() {
            //       return IconButton(
            //           icon: Icon(
            //               playerController.playState.value == PlayerState.playing
            //                   ? Icons.pause
            //                   : Icons.play_arrow),
            //           onPressed: () {
            //             playerController.smartPlay();
            //           });
            //     }),
            //     IconButton(
            //       icon: Icon(Icons.skip_next),
            //       onPressed: () {
            //                       playerController.next();
            //                     },
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

extension durationExtensions on Duration {
  String get timeFormat {
    String minute = int.parse(
            this.toString().split('.').first.padLeft(8, "0").split(':')[1])
        .toString();
    String second =
        this.toString().split('.').first.padLeft(8, "0").split(':')[2];
    return ("$minute:$second");
  }
}
