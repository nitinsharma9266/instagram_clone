import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  static const String demoVideo =
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,

      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,

        itemBuilder: (context, index) {
          return const ReelItem();
        },
      ),
    );
  }
}

class ReelItem extends StatefulWidget {
  const ReelItem({super.key});

  @override
  State<ReelItem> createState() => _ReelItemState();
}

class _ReelItemState extends State<ReelItem> {

  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = VideoPlayerController.networkUrl(
      Uri.parse(ReelsScreen.demoVideo),
    )..initialize().then((_) {

      if (!mounted) return;

      setState(() {});

      controller.setLooping(true);
      controller.play();
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Stack(
      fit: StackFit.expand,
      children: [

        if (controller.value.isInitialized)
          FittedBox(
            fit: BoxFit.cover,
            child: SizedBox(
              width: controller.value.size.width,
              height: controller.value.size.height,
              child: VideoPlayer(controller),
            ),
          )
        else
          const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),

        // Right side buttons
        Positioned(
          right: 12,
          bottom: 100,

          child: Column(
            children: [

              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 32,
                ),
              ),

              const Text(
                'Like',
                style: TextStyle(color: Colors.white),
              ),

              const SizedBox(height: 20),

              const Icon(
                Icons.comment_outlined,
                color: Colors.white,
                size: 30,
              ),

              const SizedBox(height: 20),

              const Icon(
                Icons.send,
                color: Colors.white,
                size: 30,
              ),
            ],
          ),
        ),

        // Bottom username
        const Positioned(
          left: 15,
          bottom: 30,

          child: Text(
            '@instagram_user\nEnjoying the moment!',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),

        // Play / Pause
        Center(
          child: IconButton(
            onPressed: () {

              setState(() {
                if (controller.value.isPlaying) {
                  controller.pause();
                } else {
                  controller.play();
                }
              });

            },
            icon: Icon(
              controller.value.isPlaying
                  ? Icons.pause_circle_outline
                  : Icons.play_circle_outline,
              color: Colors.white,
              size: 55,
            ),
          ),
        ),
      ],
    );
  }
}