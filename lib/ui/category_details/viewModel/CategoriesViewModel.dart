import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_c10_online/model/news_response/Article.dart';
import 'package:news_c10_online/shared/api/api_manager.dart';

import '../../../model/sources_response/Source.dart';

class CategoryDetailsViewModel extends Cubit<CategoryDetailsStates>{
  CategoryDetailsViewModel():super(CategoryDetailInitialState());

  getSources(String categoryid)async{
    emit(SourcesLoadingState());
    try{
      var sourcesResponse = await ApiManager.getSources(categoryid);
      if(sourcesResponse.status == "error"){
        // handle error
        emit(SourcesErrorState(sourcesResponse.message??""));
      }else{
       // handle success
        emit(SourcesSuccessState(sourcesResponse.sources??[]));
      }
    }catch(error){
      // handle error
      emit(SourcesErrorState(error.toString()));
    }
  }

  getNews(String sourceId)async{
    emit(NewsLoadingState());
    try{
      var newsResponse = await ApiManager.getNews(sourceId);
      if(newsResponse.status == "error"){
        // handle error
        emit(NewsErrorState(newsResponse.message??""));
      }else{
        // handle success
        emit(NewSuccessState(newsResponse.articles??[]));
      }
    }catch(e){
      // handle error
      emit(NewsErrorState(e.toString()));
    }

  }

}

abstract class CategoryDetailsStates{}
class CategoryDetailInitialState extends CategoryDetailsStates{}
class SourcesLoadingState extends CategoryDetailsStates{}
class SourcesErrorState extends CategoryDetailsStates{
  String errorMessage;
  SourcesErrorState(this.errorMessage);
}
class SourcesSuccessState extends CategoryDetailsStates{
  List<Source> sources;
  SourcesSuccessState(this.sources);
}

class NewsLoadingState extends CategoryDetailsStates{}
class NewsErrorState extends CategoryDetailsStates{
  String errorMessage;
  NewsErrorState(this.errorMessage);
}
class NewSuccessState extends CategoryDetailsStates{
  List<Article> artices;
  NewSuccessState(this.artices);
}