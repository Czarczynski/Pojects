import 'package:smart_cooking/app_config.dart';
import 'package:smart_cooking/blocs/recipes_bloc.dart';
import 'package:smart_cooking/pages/drawer_page.dart';
import 'package:smart_cooking/pages/recipes_list.dart';
import 'package:smart_cooking/pages/recipes_search.dart';
import 'package:flutter/material.dart';

class RecipesPage extends StatelessWidget {
  String cuisine, diet;

  RecipesPage({this.cuisine,this.diet});
  @override
  Widget build(BuildContext context) {
    var _bloc = RecipesResultBloc(context, cuisine, diet);
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(

        brightness: Brightness.dark,
        backgroundColor: Colors.transparent,
        title: Text(
          EnglishVer.RECIPES,
          style: Theme.of(context).textTheme.title,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 8, right: 16),
            child: InkWell(
              onTap: () {
                showSearch(
                  context: context,
                  delegate: RecipesSearch(_bloc.recipeModels),
                );
              },
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      drawer: DrawerPage(CurrentDrawerPage.RECIPES_PAGE),
      body: RecipesList(context,this.cuisine, this.diet),
    );
  }
}
