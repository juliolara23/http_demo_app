import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:httpget_demo_app/model/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ListTile(
                title: const Text("Titulo"),
                subtitle: Text(post.title),
              ),
              ListTile(
                title: const Text("Id"),
                subtitle: Text("${post.id}"),
              ),
              ListTile(
                title: const Text("Contenido"),
                subtitle: Text(post.body),
              ),
              ListTile(
                title: const Text("Id usuario"),
                subtitle: Text("${post.UserId}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
