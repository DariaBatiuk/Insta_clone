import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/home/media.dart';
import 'package:video_player/video_player.dart';

class HomeMediaSlider extends StatefulWidget {
  final List<Media> mediaList;

  const HomeMediaSlider({super.key, required this.mediaList});

  @override
  State<HomeMediaSlider> createState() => _HomeMediaSliderState();
}

class _HomeMediaSliderState extends State<HomeMediaSlider> {
  int _currentIndex = 0;
late List<VideoPlayerController?> _videoControllers;
@override
  void initState() {
    super.initState();
    _initializeVideoControllers();
  }

void _initializeVideoControllers() {
  _videoControllers = widget.mediaList.map((media) {
    if (media.type == MediaType.video) {
      final controller = VideoPlayerController.networkUrl(Uri.parse(media.value))
        ..initialize().then((_) {
          setState(() {});
        });
      return controller;
    }
    return null;
  }).toList();
}

void _playCurrentVideo() {
  if(widget.mediaList[_currentIndex].type == MediaType.video){
    _videoControllers[_currentIndex]!.play();
  }
}
  
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: widget.mediaList.asMap().entries.map((entry) {
          int index = entry.key;
          Media media = entry.value;
          return Builder(
              builder: (BuildContext context) {
                if(media.type == MediaType.image){
                  return Image.network(media.value);
                } else {
                  return VideoPlayer(_videoControllers[index]!);
                }
              }
          );

        }).toList(),
        options: CarouselOptions(
          height: 520.0,
          aspectRatio: 1,
          viewportFraction: 1.0,
          enableInfiniteScroll: false,
          onPageChanged: (index, _ ) {
            setState(() {
              _currentIndex = index;
            });
            _playCurrentVideo();
          }
        )
    );
  }
}

