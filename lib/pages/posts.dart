import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:httpget_demo_app/model/post_model.dart';
import 'package:httpget_demo_app/pages/post_detail.dart';
import 'package:httpget_demo_app/services/http_service.dart';

class PostPage extends StatelessWidget {
  final HttpService httpService = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Post"),
        ),
        body: FutureBuilder(
            future: httpService.getPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> post = snapshot.data!;
                return ListView(
                  children: post
                      .map((Post post) => ListTile(
                            title: Text(post.title),
                            subtitle: Text("${post.UserId}"),
                            onTap: () =>
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => PostDetail(
                                          post: post,
                                        ))),
                          ))
                      .toList(),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }
}
