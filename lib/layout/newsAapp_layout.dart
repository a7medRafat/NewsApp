import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/appcubit/appcubit.dart';
import 'package:news_app_tst2/components/components.dart';
import 'package:news_app_tst2/cubit/cubit.dart';
import 'package:news_app_tst2/cubit/states.dart';
import 'package:news_app_tst2/search/search_screen.dart';

class NewsLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit ,NewsStates>(
        listener: (context , state){},
        builder: (context,state){
          
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('News App'),
              actions: [
                IconButton(
                  icon: Icon(Icons.search_rounded ,size: 30,),
                  onPressed: (){
                    navigateTo(context, SsearchScreen());
                  },

                ),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined ,size: 30,),
                  onPressed: (){
                    AppCubit.get(context).changeAppMood();
                    // NewsCubit.get(context).changeAppMood();
                  },

                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(

              type: BottomNavigationBarType.fixed,
              currentIndex: NewsCubit.get(context).currentIndex,
              onTap: (index){
                NewsCubit.get(context).changeNavButton(index);
              },
              items: [
                BottomNavigationBarItem(
                    icon: Icon(Icons.business,size: 27,),
                    label: 'Business'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.sports,size: 27,),
                    label: 'Sports'
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.science_outlined,size: 27,),
                    label: 'Science'
                ),
              ],

            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
