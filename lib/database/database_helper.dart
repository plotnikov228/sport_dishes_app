import 'dart:async';

import 'package:path/path.dart';
import 'package:ex/models/database_table_models/dishes_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._();

  DatabaseHelper._();

  late Database db;

  factory DatabaseHelper() {
    return _databaseHelper;
  }

  Future<void> initDB() async {
    db = await openDatabase(
      join(await getDatabasesPath(), 'users_demo.db'),
      onCreate: (database, version) async {
        await database.execute(
          'CREATE TABLE dishes (id INTEGER PRIMARY KEY,name TEXT NOT NULL, description TEXT NULL, structure TEXT NULL,cooking_method TEXT NULL,kilocalories TEXT NULL, image TEXT NULL)',
        );
      },
      version: 1,
    );
  }

  Future<int> insertDishes(DishesModel dishesModel) async {
    int result = await db.insert('dishes', dishesModel.toMap());
    return result;
  }

  Future<List<DishesModel>> retrieveDishes() async {
    if (databaseIsEmpty != false) {
      fillingDB();
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('db', false);
    }

    final List<Map<String, Object?>> queryResult = await db.query('dishes');
    return queryResult.map((e) => DishesModel.fromMap(e)).toList();
  }

  void fillingDB() {
    insertDishes(DishesModel(
        1,
        'Ratatouille with chicken',
        "Michel Gerard is clearly not an athlete, because there is no protein in his dish at all! We fixed it.The recipe is almost original, as you understand, only our favorite chicken breast was added to it.",
        """For two servings:
Sweet pepper 2 pieces
Chicken breast — 300 gr.
Garlic 2.5 cloves
Onion — half
Eggplant 1.5 pieces
Zucchini 1 piece
Tomatoes 2 pieces
Parsley 2 tablespoons
Thyme — half a teaspoon
Olive oil 2 tablespoons
Bay leaf 2 pieces
Balsamic vinegar 1.5 teaspoons
Salt to taste
Ground black pepper to taste""",
        """Previously:
Chop the onion. Cut the pepper into cubes. Remove one tomato from the skin (to do this, put it in boiling water for 5-10 seconds) and seeds, then also cut into cubes.

Sauce:
Fry the onion in olive oil lightly (until soft), squeeze garlic into the pan, add tomato and pepper, sprinkle with thyme and toss two bay leaves.
Cut eggplant, tomatoes, chicken and zucchini into slices. Put the sauce on the bottom of the baking sheet and then lay our slices in layers. Put in the oven for 200 g until the vegetables turn golden.
At the very end, chop the parsley finely, pour it with olive oil, vinegar, salt, pepper and then spread the baked vegetables with this.""",
        '',
        'assets/1.jpg'));

    insertDishes(DishesModel(
        2,
        'Diet bars with quinoa',
        "Diet is a test for any athlete. We have to limit ourselves significantly in the daily choice of products. And instead of the usual fried, spiced dishes, switch to stewed, boiled and steamed. You can forget about sweets at all! But what can replace chocolates and candies? There is a way out — diet bars with quinoa.",
        """We will need:
oat flakes — 1 cup;
quinoa (dry) — a quarter cup;
cranberries — half a cup;
nuts (walnuts) — a third of a cup;
prunes — a third of a cup;
bananas — 2 pieces;
*We use a standard kitchen bowl with a volume of 400 ml.""",
        """Mix the oat flakes and quinoa thoroughly. Add cranberries, nuts and prunes to the resulting mass.
In a blender, grind everything to a homogeneous mass.
Add bananas to this mass and grind again with a blender.
From this mixture you need to get elongated "sausages" of the same size. If the mass is too liquid, then add more oatmeal. The consistency of the mixture is influenced by bananas: if some are ripe, then the mixture will turn out to be viscous, and if not ripe, then the mixture will be liquid.
We pack the sausages in foil and flatten them so that they resemble the shape of bars.
The resulting briquettes are put in a preheated oven to 160 degrees and bake for 20-30 minutes.
The bars are ready! Bon appetit.""",
        '',
        'assets/2.jpg'));

    insertDishes(DishesModel(
        3,
        'Salad with lightly salted salmon',
        """Monotony can be attributed to the tangible disadvantages of any diet. On the table of a losing weight every day you can see the same dishes. Even experienced athletes will quickly get tired of this arrangement, let alone amateurs who are just trying to start eating right.
In case the breast and buckwheat no longer climb into the throat, keep the salad recipe. It is easy to cook it in 5 minutes and it will not be able to harm your figure.""",
        """It contains only useful products:
1) Lightly salted salmon — 50 grams.
2) Spinach — 50 grams.
3) Fried, salted sunflower seeds — 20 grams.
4) Half a cucumber.
5) Cherry tomatoes — 5 pieces.
6) Salt / pepper — 1 pinch each.
7) Olive oil to taste.""",
        """All vegetables must be thoroughly rinsed.
Cut half of the cucumber and tomatoes into thin rings.
Cut the salmon into slices
Place the vegetables and seeds in a deep dish, mix together and pour olive oil.
Add salt and pepper.
Put slices of fish on top of the resulting dish.
Your salad is ready! You can serve it on the table.""",
        "",
        'assets/3.jpg'));

    insertDishes(DishesModel(
        4,
        'Diet fish steak',
        "Dinner occupies a special place in the athlete's diet. For dinner, it is not recommended to eat a large amount of carbohydrates (it is better to give up fast carbohydrates altogether), but you need more protein. In this article we will tell you the recipe for a healthy high-protein dinner, which will be useful at any stage of the protein diet.",
        """1. Fish — 200 grams. It is better to take cod, but tilapia or catfish is allowed as a substitute.
2. Greek yogurt — 150 grams.
3. Broccoli — 200 grams.
4. Garlic — 3 cloves.
5. Lemon juice — 1 tablespoon.
6. Pepper, salt, rosemary — to taste.""",
        """Cut the fish into medium-sized pieces. Rub each piece with garlic, pour lemon juice and let it stand for 20 minutes.
Add pepper and finely chopped garlic to the yogurt.
Add broccoli to boiling water and cook for 5 minutes over low heat. Don't forget to salt it all.
The fish must be fried for 5 minutes on each side.
Put the broccoli and fish on a plate and pour over the resulting yogurt sauce.
The dish is ready, you can serve it on the table!""",
        '',
        'assets/4.jpg'));

    insertDishes(DishesModel(
        5,
        'Cheesecakes with casein',
        'A great option for a healthy breakfast, rich in protein.',
        """1. 500 gr. cottage cheese 0%
2. 290 gr. pumpkin
3. 1 whole egg and 2 egg whites
4. 60 gr. casein
5. 1 tsp baking powder 50 gr. milk 0.5%""",
        """Mix cottage cheese, eggs, casein, baking powder and milk in a bowl until smooth.
    Whisk the proteins to a stable foam, add to our mixture, stirring gently with a spoon.
    Three pumpkin on a coarse grater and add to the rest of the ingredients, again gently stirring (this is necessary so that the proteins do not settle).
    Spread the mixture on a preheated frying pan with a tablespoon, fry the cheesecakes on both sides, covering with a lid.
        When serving, you can decorate with fresh fruits, berries or serve with low-calorie syrup""",
"""Nutritional value per 100 gr.
        Proteins: 14.73 g.
        Fats: 1.68 g.
        Carbohydrates: 5,19 g.
        Calorie content: 91.87 kcal""",
        'assets/5.jpg'));

    insertDishes(DishesModel(
        6,
        'Protein Chocolate Mix',
        'This breakfast has power not only because it contains protein, but also because it includes coffee, which will give you a boost of energy at the beginning of the day.',
        """1. 1 scoop of protein
2. 1 teaspoon of instant coffee
3. 1 teaspoon of cocoa
4. 1 cup of low-fat yogurt
5. A third of a cup of muesli
6. Fresh blueberries
7. 1 tablespoon of chocolate flakes
8. 1 tablespoon of crushed nuts""",
        """Place the muesli in a jar or a large glass.
Pour a third of a cup of yogurt on top.
Mix ⅓ cups of yogurt with crushed nuts. Add to the container.
Mix ⅓ cups of yogurt with protein, coffee and cocoa. Put it in a jar.
Sprinkle chocolate flakes and blueberries on top.""",
        "",
        'assets/6.jpg'));

    insertDishes(DishesModel(
        7,
        'Protein-banana breakfast',
        'Bananas for breakfast? Yes, you heard right! For anyone who does cardio in the morning, this is a great way to replenish glycogen reserves.',
        """1. 1 medium-sized banana
2. Three quarters of a cup of low-fat yogurt
3. Half a scoop of protein
4. Several sliced strawberries
5. A quarter cup of blueberries
6. 1 tablespoon of muesli
7. A teaspoon of grated chocolate""",
        """Cut the banana lengthwise into 2 halves and arrange them in a plate.
Mix the protein with yogurt, place it all on top of the bananas.
Pour the remaining ingredients on top.""",
        '',
        'assets/7.jpg'));

    insertDishes(DishesModel(
        8,
        'Oatmeal pancakes with protein',
        '',
        """1. 1 scoop of Optimum protein: Gold Standard 100% Whey (with chocolate flavor)
2. 150 grams of oat flour (if there is no oat flour, you can make it yourself by grinding it into oat flakes)
3. 2 egg whites
4. stevia or any other sweetener
5. skimmed milk
6. cinnamon""",
        """Mix everything with a blender, the resulting mixture should be similar in consistency to liquid sour cream. Bake like pancakes, in a non-stick frying pan. If you are not on "drying", then you can add pieces of your favorite fruit or berries to the dough!) Enjoy your meal.""",
        '',
        'assets/8.jpg'));
  }
}
late bool? databaseIsEmpty;

late List<DishesModel> dishesList;
