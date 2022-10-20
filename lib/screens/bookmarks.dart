import 'package:ex/screens/dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../models/database_table_models/dishes_model.dart';

class BookmarksScreen extends StatefulWidget {
  const BookmarksScreen({Key? key}) : super(key: key);

  @override
  State<BookmarksScreen> createState() => _BookmarksScreenState();
}

class _BookmarksScreenState extends State<BookmarksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmarks'),
        leading: IconButton(onPressed: () {Navigator.of(context).pushNamedAndRemoveUntil('/menu', (route) => true);}, icon: Icon(Icons.arrow_back),),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
          itemCount: bookmarksList.length,
          itemBuilder: (context, index) {
         return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute( builder: (context) => DishScreen(dishesModel: bookmarksList[index])));
                },
                child: Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(bookmarksList[index].image, fit: BoxFit.cover,),),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          bookmarksList[index].name,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GradientText(
                          '${bookmarksList[index].description.isEmpty ? bookmarksList[index].structure : bookmarksList[index].description}...',
                          maxLines: 4,
                          gradientType: GradientType.linear,
                          gradientDirection: GradientDirection.ttb,
                          radius: .4,
                          colors: const [
                            Colors.black,
                            Colors.black12,
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
      }),
    );
  }
}

List<DishesModel> bookmarksList = [];