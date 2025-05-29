import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app.components/app_bottom_navigation_bar.dart';
import 'package:flutter_course/app_constants.dart';
import 'package:flutter_course/home/home.components/home-media-slider.dart';
import 'package:flutter_course/home/media.dart';
import 'package:flutter_course/posts/post.dart';
import 'package:flutter_course/posts/post.service.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PostService _postService = PostService();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        toolbarHeight: 64.0,
        leading: Padding(
          padding: EdgeInsets.only(left: AppConstants.defaultPaddingValue),
          child: SvgPicture.asset("assets/app_logos/instagramClone_logo_text-dark.svg", semanticsLabel: "Text logo",),
        ),
        leadingWidth: 120.0,
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: AppConstants.defaultPaddingValue),
              icon: Icon (CupertinoIcons.heart),
            onPressed: () => print("Heart"),)
        ],

      ),
      body: SafeArea(
          child: StreamBuilder<List<Post>>(
              stream: _postService.getPosts(),
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting) {
                  return const Scaffold(body: Center(child: CircularProgressIndicator()));
                } else if (snapshot.hasError) {
                  print(snapshot.error);
                  return const Center(child: Text("Error"),);
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No posts found"));
                }
                List<Post> posts = snapshot.data!;
                return ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index){
                    Post post = posts[index];
                    return Card(
                      elevation: 0.0,
                      color: Colors.transparent,
                      child: Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              backgroundImage: NetworkImage(post.avatar),
                            ),
                            contentPadding: EdgeInsets.symmetric(vertical: 0.0, horizontal: AppConstants.defaultPaddingValue),
                            textColor: Colors.black,
                            title: Text(post.userName),
                            titleTextStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold),
                            titleAlignment: ListTileTitleAlignment.center,
                            subtitle: Text("Suggested for you"),
                            subtitleTextStyle: TextStyle(fontSize: 10.0),
                            trailing: Icon(Icons.more_vert),
                          ),
                    
                    HomeMediaSlider(mediaList: post.media)
                    
                    //       SizedBox(
                    //       width: MediaQuery.of(context).size.width,
                    //        height: 300.0,
                    //        child: ListView.builder(
                    //        scrollDirection: Axis.horizontal,
                    //        itemCount: post.media.length,
                    //        itemBuilder: (context, index) {
                    //        MediaType mediaType = post.media[index].type;
                    //        String mediaValue = post.media[index].value;
                    //
                    //   return SizedBox(
                    //     width: MediaQuery.of(context).size.width,
                    // child: mediaType == MediaType.image ? Image.network(mediaValue, fit: BoxFit.cover,) : Text("Video"),
                    // );
                    //
                    // },
                    //       )
                    //       )
                        ],
                      ),
                    );
                  }
                );
              }
          ),
      ),
      bottomNavigationBar: AppBottomNavigationBar(currentIndex: 0,),
    );
  }
}
