import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/components/components.dart';
import 'package:news_app_tst2/cubit/cubit.dart';
import 'package:news_app_tst2/cubit/states.dart';

class SsearchScreen extends StatelessWidget {

  var myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (BuildContext context) =>NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context,state){},
        builder: (context,state){

          var list  = NewsCubit.get(context).search;

          return Scaffold(
            appBar: AppBar(),
            body: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: defaultTextFiled(
                    MyController: myController,
                    mySuffixIcon: Icons.search,
                    onChange: (value){
                      NewsCubit.get(context).getSearch(value);
                    },
                    validation: ( value){
                      if(value.isEmpty){
                        return'Search is empty';
                      }
                      return null;
                    },
                    labelTxt: 'Search Here',
                    radius: BorderRadius.circular(20),
                    txtType: TextInputType.text,
                  ),
                ),
                Expanded(child: articleItem(list, state)),
              ],
            ),
          );
        },
      ),
    );
  }
}
