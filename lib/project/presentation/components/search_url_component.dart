import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SearchUrlComponent extends StatefulWidget {
  const SearchUrlComponent({Key? key}) : super(key: key);

  @override
  SearchUrlComponentState createState() => SearchUrlComponentState();
}

class SearchUrlComponentState extends State<SearchUrlComponent> {
  late VideoPlayerController controller;
  @override
  void initState() {
    controller = VideoPlayerController.networkUrl(
      Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
      ),
    )
      ..initialize()
      ..play()
      ..setLooping(true).then((value) {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: const BoxDecoration(
        color: Colors.deepPurple,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(
              hintText: 'url....',
              filled: true,
              fillColor: Colors.white,
              contentPadding: const EdgeInsetsDirectional.all(16.0),
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.send),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
            ),
          ),
          if (controller.value.isInitialized)
            AspectRatio(aspectRatio: 16 / 9, child: VideoPlayer(controller)),
        ],
      ),
    );
  }
}
