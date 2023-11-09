import 'package:flutter/material.dart';
import 'package:radioapp/models/category_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Kanaler',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 150,
                child: ListView.separated(
                  itemCount: categories.length,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(width: 25,),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: categories[index].boxColor.withOpacity(0.3)
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('SR Radio Tablå'),
      centerTitle: true,
    );
  }
}
