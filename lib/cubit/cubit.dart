import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/cubit/states.dart';
import 'package:news_app_tst2/modules/business_screen.dart';
import 'package:news_app_tst2/modules/science_screen.dart';
import 'package:news_app_tst2/modules/sports_screen.dart';
import 'package:news_app_tst2/network/remote/dio_helper.dart';

 class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialStates());

  static NewsCubit get(context)=> BlocProvider.of(context);

  List<Widget> screens=[
    Business_Screen(),
    Sports_Screen(),
    Science_Screen(),
  ];

  int currentIndex = 0;

  void changeNavButton(int index){
    currentIndex = index;
    if (index == 1)
      getSports();
    else if (index == 2)
      getScience();

    emit(NewsChangeNavBarStates());
  }

  List <dynamic> business =[];
  List <dynamic> sports =[];
  List <dynamic> science =[];
  List <dynamic> search =[];

  void getBusiness(){
    emit(NewsGetDataBusinessLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          'apiKey' : 'c2a78dc092f24d6280b220797ec0549a',
        }
    ).then((value) {
      print(value.data['totalResults']);
      business = value.data['articles'];
      emit(NewsGetDataBusinessSuccessStates());
    }).catchError((errors){
      print(errors.toString());
      emit(NewsGetDataBusinessErrorStates());
    });
  }

  void getSports(){
    emit(NewsGetDataSportsLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'sports',
          'apiKey' : 'c2a78dc092f24d6280b220797ec0549a',
        }
    ).then((value) {
      print(value.data['totalResults']);
      sports = value.data['articles'];
      emit(NewsGetDataSportsSuccessStates());
    }).catchError((errors){
      print(errors.toString());
      emit(NewsGetDataSportsErrorStates());
    });
  }

  void getScience(){
    emit(NewsGetDataScienceLoadingStates());
    DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'science',
          'apiKey' : 'c2a78dc092f24d6280b220797ec0549a',
        }
    ).then((value) {
      print(value.data['totalResults']);
      science = value.data['articles'];
      emit(NewsGetDataScienceSuccessStates());
    }).catchError((errors){
      print(errors.toString());
      emit(NewsGetDataScienceErrorStates());
    });
  }


  void getSearch(String value){

    emit(NewsGetSearchLoadingStates());

    DioHelper.getData(
        url: 'v2/everything',
        query: {
          'q': '$value',
          'apiKey' : 'c2a78dc092f24d6280b220797ec0549a',
        }
    ).then((value) {
      print(value.data['totalResults']);
      search = value.data['articles'];
      emit(NewsGetSearchSuccessStates());
    }).catchError((errors){
      print(errors.toString());
      emit(NewsGetSearchErrorStates());
    });
  }

  // bool isDark = false;
  //
  // void changeAppMood(){
  //   isDark = !isDark;
  //   emit(NewsChangeAppMoodStates());
  // }
}


