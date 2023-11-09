import 'package:flutter/material.dart';
import 'package:radioapp/api_call.dart';
import 'package:radioapp/models/category_model.dart';
import 'package:bottom_navbar_player/bottom_navbar_player.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  late List<CategoryModel> categories;
  late String apiUrl;
  late String audioUrl;

  final bottomNavBarPlayer = BottomNavBarPlayer();

  @override
  void initState() {
    super.initState();
    _getCategories();
    apiUrl =
        'https://api.sr.se/v2/scheduledepisodes?channelid=132&format=json&size=100';
    audioUrl =
        'https://sverigesradio.se/topsy/direkt/srapi/132.mp3';
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
            _channels(),
            const SizedBox(
              height: 10,
            ),
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
                  height: 420,
                  child: ApiCall(apiUrl: apiUrl),
                ),
              ],
            ),
          ],
        ),
        floatingActionButton:
          FloatingActionButton(
            tooltip: 'Spela radio',
          onPressed: () => bottomNavBarPlayer.play(
            audioUrl,
            sourceType: SourceType.url,
            playerSize: PlayerSize.min,
            mediaType: MediaType.audio,
          ),
          backgroundColor: Colors.blueGrey,
           child: const Icon(Icons.play_arrow_rounded),
        ),
      
      bottomNavigationBar: bottomNavBarPlayer.view(),
      );
  }

  Column _channels() {
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
          height: 100,
          child: ListView.separated(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            separatorBuilder: (context, index) => const SizedBox(
              width: 25,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    apiUrl = categories[index].scheduleurl;
                    audioUrl = categories[index].radioUrl;
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
