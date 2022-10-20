import 'package:ex/models/database_table_models/dishes_model.dart';
import 'package:ex/screens/bookmarks.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DishScreen extends StatelessWidget {
  final DishesModel dishesModel;
  const DishScreen({Key? key, required this.dishesModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
              child: Align(alignment: Alignment.topLeft,
                  child: IconButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, icon: const Icon(Icons.arrow_back),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(alignment: Alignment.topLeft,
              child: Text(dishesModel.name, style: Theme.of(context).textTheme.headline4,)),
            ),
            Padding(padding: const EdgeInsets.fromLTRB(16, 0, 16, 0), child: Text(dishesModel.description.isEmpty ? '' : dishesModel.description)),
            Padding(padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(dishesModel.image, fit: BoxFit.cover,)),),
            Padding(padding:  const EdgeInsets.all(16.0),
            child: Text('You will need:\n${dishesModel.structure}'),),
            Padding(padding:  const EdgeInsets.all(16.0),
              child: Text('Cooking method:\n${dishesModel.cookingMethod}'),),
            Padding(padding:  const EdgeInsets.all(16.0),
              child: Text(dishesModel.kilocalories.isEmpty ? '' : dishesModel.kilocalories),),
            Padding(padding: const EdgeInsets.all(32.0),
            child: ElevatedButton(
              onPressed: () {
                if(dishesModel.isFavorite == false) {
                  bookmarksList.add(dishesModel);
                  dishesModel.isFavorite = true;
                  setDishFavorite(dishesModel, true);
                  Navigator.of(context).pushNamed('/bookmarks');
                } else {
                  bookmarksList.remove(dishesModel);
                  dishesModel.isFavorite = false;
                  setDishFavorite(dishesModel, false);
                  Navigator.of(context).pushNamed('/menu');

                }

              },

              child: Text(dishesModel.isFavorite == true ? 'Remove from bookmarks' : 'Add to bookmarks', style: TextStyle(color: dishesModel.isFavorite == true ? Colors.red : Colors.black),),
            ),)


          ],
        ),
      ),
    );
  }
}
Future setDishFavorite (DishesModel model, bool isFav) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isFavorite${model.id}', isFav);
}