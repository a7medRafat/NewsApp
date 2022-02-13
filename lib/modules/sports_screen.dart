import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_tst2/components/components.dart';
import 'package:news_app_tst2/cubit/cubit.dart';
import 'package:news_app_tst2/cubit/states.dart';

class Sports_Screen extends StatelessWidget {
  const Sports_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<NewsCubit , NewsStates>(
      listener: (BuildContext context, state) { },
      builder: (BuildContext context, Object? state) {

        var list = NewsCubit.get(context).sports;

        return articleItem(list, state);
      },
    );
  }

}

Widget buildSeparator()=>
    Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        color: Colors.grey,
        height: 1,
        width: double.infinity,
      ),
    );