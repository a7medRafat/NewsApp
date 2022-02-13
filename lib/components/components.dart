import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_tst2/cubit/states.dart';
import 'package:news_app_tst2/modules/business_screen.dart';
import 'package:news_app_tst2/modules/webView/web_view_screen.dart';

Widget buildArticleItem(articles, context) => InkWell(
  onTap: (){
    // WebViewScreen(articles['url']);
  },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              width: 170,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: DecorationImage(
                  image: NetworkImage('${articles['urlToImage']}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '${articles['title']}',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${articles['description']}',

                    style: Theme.of(context).textTheme.bodyText2,

                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,

                    // style: Theme.of(context).textTheme.bodyText2,

                    // maxLines: 2,

                    // overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

Widget articleItem(list, state) => ConditionalBuilder(
      condition: state is! NewsGetDataBusinessLoadingStates,
      builder: (context) => ListView.separated(
        itemBuilder: (context, index) => buildArticleItem(list[index], context),
        separatorBuilder: (context, index) => buildSeparator(),
        itemCount: list.length,
      ),
      fallback: (context) => Center(child: CircularProgressIndicator()),
    );

Widget defaultTextFiled({
  required TextEditingController MyController,
  required IconData mySuffixIcon,
  required final validation,
  required String labelTxt,
  required BorderRadius radius,
  required TextInputType txtType,
  final ontap,
  final onChange,
}) =>
    TextFormField(
      onChanged: onChange,
      keyboardType: txtType,
      onTap: ontap,
      validator: validation,
      controller: MyController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: radius,
        ),
        prefixIcon: Icon(
          mySuffixIcon,
          color: Colors.black,
        ),
        labelText: labelTxt,
        labelStyle: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 25,
        ),
      ),
    );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );
