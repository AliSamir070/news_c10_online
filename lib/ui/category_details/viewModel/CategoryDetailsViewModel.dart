import 'package:flutter/material.dart';
import 'package:news_c10_online/model/sources_response/Source.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';

import '../../../model/news_response/Article.dart';

class CategoryDetailsViewModel extends ChangeNotifier{

  // handling sources
  List<Source> sourcesList = [];
  String? errorMessage;
  bool showLoading = false;
  getSources(String categoryId)async{
    showLoading = true;
    notifyListeners();
    try{
      var sourcesResponse = await ApiManager.getSources(categoryId);
      showLoading = false;
      if(sourcesResponse.status == "error"){
        // handle error
        errorMessage = sourcesResponse.message;
      }else{
        // handle success
        sourcesList = sourcesResponse.sources??[];
      }
      notifyListeners();
    }catch(error){
      showLoading = false;
      errorMessage = error.toString();
      notifyListeners();
    }
  }

  // handling news

  List<Article> articles = [];
  String? newsErrorMessage;
  bool showNewsLoading = false;
  getNews(String sourceId)async{
    showNewsLoading = true;
    notifyListeners();
    try{
      var newsResponse = await ApiManager.getNews(sourceId);
      showNewsLoading = false;
      if(newsResponse.status == "error"){
        // handle error
        newsErrorMessage = newsResponse.message;
      }else{
        // handle data
       articles =  newsResponse.articles??[];
      }
      notifyListeners();
    }catch(e){
      // handle error
      showNewsLoading = false;
      newsErrorMessage = e.toString();
      notifyListeners();
    }
  }
}