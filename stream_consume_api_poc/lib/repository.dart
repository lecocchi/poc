import 'package:dio/dio.dart';

import 'post.dart';

class Repository {
  Future<List<Post>> fetch() async {
    final Dio dio = Dio();

    Response response =
        await dio.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception(response.statusCode);
    }
  }
}
