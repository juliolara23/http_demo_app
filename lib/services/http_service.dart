import 'dart:convert';

import 'package:get/get.dart';
import 'package:httpget_demo_app/model/post_model.dart';
import 'package:http/http.dart' as http;

class HttpService extends GetxController {
  static const PostUrl = "jsonplaceholder.typicode.com";
  static const String path = "/posts";

  Future<List<Post>> getPosts() async {
    Uri uri = Uri.http(PostUrl, path);
    http.Response res = await http.get(uri);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);

      List<Post> posts =
          body.map((dynamic item) => Post.fromJson(item)).toList();
      return posts;
    } else {
      throw "Ha ocurrido un error";
    }
  }
}
