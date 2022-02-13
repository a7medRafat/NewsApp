import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/cubit/states.dart';
import 'appStates.dart';

 class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialStates());

  static AppCubit get(context)=> BlocProvider.of(context);


  bool isDark = false;

  void changeAppMood(){
    isDark = !isDark;
    emit(AppChangeAppMoodStates());
  }
}