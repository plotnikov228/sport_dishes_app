import 'package:ex/screens/dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:ex/database/database_helper.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('/bookmarks');
                  },
                  icon: const Icon(Icons.bookmark))
            ],
            pinned: true,
            snap: false,
            floating: false,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text("Menu"),
              background: Image.asset(
                'assets/govyadina-s-chernoslivom.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
                  childCount: dishesList.length, (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              DishScreen(dishesModel: dishesList[index])));
                    },
                    child: Stack(
                      children: [
                        Card(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    dishesList[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  dishesList[index].name,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GradientText(
                                  '${dishesList[index].description.isEmpty ? dishesList[index].structure : dishesList[index].description}..',
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
                        Visibility(
                            visible: dishesList[index].isFavorite == true,
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(0, 6, 16, 0),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: Icon(
                                  Icons.bookmark,
                                  color: Colors.red,
                                ),
                              ),
                            ))
                      ],
                    ),
                  ),
                );
              }))
        ],
      ),
    );
  }
}
