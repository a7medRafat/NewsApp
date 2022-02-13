import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/layout/newsAapp_layout.dart';
import 'package:news_app_tst2/network/remote/dio_helper.dart';
import 'package:news_app_tst2/shared/bloc_observer.dart';

import 'appcubit/appStates.dart';
import 'appcubit/appcubit.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (context ,state){},
        builder: (context , state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0
                ),
                bodyText2: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 27
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.white,
                  backwardsCompatibility: false,
                  iconTheme: IconThemeData(
                    color: Colors.black,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark

                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  elevation: 20.0,
                  selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                  selectedIconTheme: IconThemeData(
                      size: 25.0
                  ),
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey
              ),
            ),
            darkTheme: ThemeData(
              textTheme: TextTheme(
                bodyText1: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0
                ),
                bodyText2: TextStyle(
                  color: Colors.grey,
                  fontSize: 12.0,
                ),
              ),
              primarySwatch: Colors.deepOrange,
              scaffoldBackgroundColor: Colors.black,
              appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 27
                  ),
                  elevation: 0.0,
                  backgroundColor: Colors.black,
                  backwardsCompatibility: false,
                  iconTheme: IconThemeData(
                    color: Colors.white,
                  ),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black,
                      statusBarIconBrightness: Brightness.light

                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.black,
                  elevation: 20.0,
                  selectedLabelStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                  selectedIconTheme: IconThemeData(
                      size: 25.0
                  ),
                  selectedItemColor: Colors.deepOrange,
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.grey
              ),
            ),
            themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: Scaffold(
              body: NewsLayout(),
            ),
          );
        },
      ),
    );
  }
}

