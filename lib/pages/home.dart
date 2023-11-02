import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  'Kanaler',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 150,
                color: Colors.green,
                // child: ListView.builder(
                //   itemBuilder: (context, index) {
                //     return Container();
                //   },
                // ),
              )
            ],
          )
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text('SR Radio Tablå'),
      centerTitle: true,
    );
  }
}
