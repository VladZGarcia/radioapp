import 'package:flutter/material.dart';
import 'package:radioapp/api_call.dart';
import 'package:radioapp/models/category_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<CategoryModel> categories;
  late String apiUrl;

  @override
  void initState() {
    super.initState();
    _getCategories();
    apiUrl = 'https://api.sr.se/v2/scheduledepisodes?channelid=132&format=json&size=100';
  }

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          _categories(),
          const SizedBox(height: 10,),
           Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  'Dagens Tablå',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              SizedBox(
                height: 430,
                child: ApiCall(apiUrl: apiUrl),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Column _categories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'Kanaler',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          height: 120,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 25,),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Update the apiUrl when a category is tapped
                  // String newApiUrl = 'https://api.sr.se/v2/scheduledepisodes?channelid=${categories[index].channelId}&format=json&size=100';
                  // Call setState to trigger a rebuild and update the ApiCall widget with the new apiUrl
                  setState(() {
                    apiUrl = categories[index].scheduleurl;
                  });
                },
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(categories[index].iconPath),
                    ),
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('SR Radio Tablå'),
      centerTitle: true,
    );
  }
}







// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:radioapp/api_call.dart';
// import 'package:radioapp/models/category_model.dart';

// class HomePage extends StatelessWidget {
//   HomePage({super.key});

//   List<CategoryModel> categories = [];

//   void _getCategories() {
//     categories = CategoryModel.getCategories();
//   }

//   @override
//   Widget build(BuildContext context) {
//     _getCategories();
//     return Scaffold(
//       appBar: appBar(),
//       backgroundColor: Colors.white,
//       body:  
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(
//             height: 20,
//           ),
//           _categories(),
//           const SizedBox(height: 10,),
//            const Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [ 
//               Padding(padding: EdgeInsets.only(left: 20),
//               child: Text('Dagens Tablå',
//               style: TextStyle(
//                 color: Colors.black,
//                 fontSize: 18,
//                 fontWeight: FontWeight.w600
//               ),
//               ),
//               ),
//               SizedBox(
//                 height: 430,
//                 child: ApiCall(apiUrl: 'https://api.sr.se/v2/scheduledepisodes?channelid=132&format=json&size=100')
//                 ),
//              ]
//           ),
//         ],
        
//       ),
//     );
//   }

//   Column _categories() {
//     return Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Padding(
//               padding: EdgeInsets.only(left: 20),
//               child: Text(
//                 'Kanaler',
//                 style: TextStyle(
//                     color: Colors.black,
//                     fontSize: 18,
//                     fontWeight: FontWeight.w600),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             SizedBox(
//               height: 120,
//               child: ListView.separated(
//                 itemCount: categories.length,
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.only(
//                   left: 20,
//                   right: 20
//                 ),
//                 separatorBuilder: (context, index) => const SizedBox(width: 25,),
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//               onTap: () {
//                 // Handle category click here
//                 log('Category clicked: ${categories[index].name}');
//                 // You can navigate to a new page, update state, or perform any other action
//               },
//               child: Container(
//                 width: 100,
//                 decoration: BoxDecoration(
//                     image: DecorationImage(
//                         image: NetworkImage(categories[index].iconPath)),
//                     borderRadius: BorderRadius.circular(16)
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         );
//   }

//   AppBar appBar() {
//     return AppBar(
//       title: const Text('SR Radio Tablå'),
//       centerTitle: true,
//     );
//   }
// }
