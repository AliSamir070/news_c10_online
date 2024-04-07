// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_c10_online/model/news_response/NewsResponse.dart';
import 'package:news_c10_online/model/sources_response/SourcesResponse.dart';
class ApiManager{
  static const String baseUrl = "newsapi.org";
  static const String apiKey = "d3e16e322c2e4c00b4b4f4967c290a7f";
  static Future<SourcesResponse> getSources(String categoryid)async{
    // https://newsapi.org/v2/top-headlines/sources?apiKey=d3e16e322c2e4c00b4b4f4967c290a7f&category=sports

    var url = Uri.https(baseUrl,"/v2/top-headlines/sources",{
      "apiKey":apiKey,
      "category":categoryid
    });
    var response = await http.get(url); // body (String) -> json (Map) -> object
    var json = jsonDecode(response.body);
    var sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<NewsResponse> getNews(String sourceId)async{
    //https://newsapi.org/v2/everything?apiKey=d3e16e322c2e4c00b4b4f4967c290a7f&sources=bbc-news
    
    var url = Uri.https(baseUrl,"/v2/everything",{
      "apiKey":apiKey,
      "sources":sourceId
    });
    var response = await http.get(url);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }

  static Future<NewsResponse> getNewsBySearch(String q)async {
    //https://newsapi.org/v2/top-headlines?apiKey=d3e16e322c2e

    var url = Uri.https(baseUrl, "/v2/everything", {
      "apiKey": apiKey,
      "q": q
    });

    var response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);
    }
    else {
      print(response.statusCode);
    }

    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }


}