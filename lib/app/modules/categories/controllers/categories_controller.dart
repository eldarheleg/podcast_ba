import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:podcast_ba/app/data/models/genre.dart';
import 'package:podcast_ba/app/data/models/podcast.dart';
import 'package:http/http.dart' as http;

class CategoriesController extends GetxController {
  final _baseUrl = "https://listen-api.listennotes.com/api/v2/genres";
  final _testUrl = "https://listen-api-test.listennotes.com/api/v2/genres";

  @override
  void onInit() {
    super.onInit();
    Genres();
  }

  RxString title = ''.obs;
  RxList<Genre> genres = <Genre>[].obs;

  Future<void> Genres() async {
    var response = await http.get(
      Uri.parse(_testUrl),
      //headers: {'X-ListenAPI-Key': 'b9b4a810abc741a49bfabefcd7707552'},
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      if (json != null) {
        
        for (var genre in json['genres']) {
          try {
            genres.add(Genre.fromJson(genre));
            title.value = genre['name'];
          } catch (e) {
            log('problem = ${genre['id']}');
            log(e.toString());
          }
        }
      }
    } else {
      log('failed to fetch');
    }
  }
}
