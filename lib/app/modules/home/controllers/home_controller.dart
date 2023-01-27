// Package imports:
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_ba/app/data/models/podcast.dart';

class HomeController extends GetxController {
  final _baseUrl = "https://listen-api.listennotes.com/api/v2/best_podcasts";
  final _testUrl = "https://listen-api-test.listennotes.com/api/v2/best_podcasts";

  @override
  void onInit() {
    super.onInit();
    fetchPodcastsByGenre();
  }

  RxString title = ''.obs;
  RxList<Podcast> bestPodcasts = <Podcast>[].obs;

  Future<void> fetchPodcastsByGenre() async {
    var response = await http.get(
      Uri.parse(_testUrl),
      //headers: {'X-ListenAPI-Key': 'b9b4a810abc741a49bfabefcd7707552'},
    );
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      if (json != null) {
        title.value = json['name'];
        for (var podcast in json['podcasts']) {
          try {
            bestPodcasts.add(Podcast.fromJson(podcast));
          } catch (e) {
            log('problem = ${podcast['id']}');
            log(e.toString());
          }
        }
      }
    } else {
      log('failed to fetch');
    }
  }
}
