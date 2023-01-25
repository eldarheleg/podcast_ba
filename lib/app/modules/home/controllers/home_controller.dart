// Package imports:
import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:podcast_ba/app/data/models/playlist.dart';

class HomeController extends GetxController {
  final _baseUrl = "https://listen-api.listennotes.com/api/v2/best_podcasts";
  //Rx<Genre> genre = Genre().obs;
  RxString genre = ''.obs;
  RxList<Podcast> podcasts = <Podcast>[].obs;
  RxList<Podcast> bestPodcasts = <Podcast>[].obs;


  Future<void> fetchPodcastsByGenre() async {
    var response = await http.get(
      Uri.parse(_baseUrl),
      headers: {'X-ListenAPI-Key': 'b9b4a810abc741a49bfabefcd7707552'},
    );
    if (response.statusCode == 200) {
      log(response.body);
      var json = jsonDecode(response.body);
      genre.value = json['name'];
      

      //podcasts.value = ;
    } else {
      print('failed to fetch');
    }
  }
}
