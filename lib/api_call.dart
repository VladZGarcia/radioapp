import 'package:radioapp/pages/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ApiCall extends StatelessWidget {
  final String apiUrl; // Add a parameter for the API URL
  const ApiCall({super.key, required this.apiUrl}); // Constructor to accept the URL

  Future<List<dynamic>> fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get(apiUrl); // Use the provided URL

    return response.data['schedule'];
  }

  String convertToTime(String dateStr) {
    int unixTimestamp = int.parse(dateStr.split('(')[1].split(')')[0]);
    DateTime dateTime =
        DateTime.fromMillisecondsSinceEpoch(unixTimestamp, isUtc: true);
    String formattedTime = DateFormat.Hm().format(dateTime);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
        future: fetchAPI(),
        builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                   // Check if imageurl is null and provide an alternative image
              String imageUrl = snapshot.data![index]['imageurl'] ?? 'https://pbs.twimg.com/profile_images/694901213209481216/t4H3j-ol_400x400.jpg';
              
                return ScheduleCard(
                  description: '${snapshot.data![index]['title']}',
                  end: convertToTime(snapshot.data![index]['endtimeutc']),
                  start: convertToTime(snapshot.data![index]['starttimeutc']),
                  imageurl: imageUrl,
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
