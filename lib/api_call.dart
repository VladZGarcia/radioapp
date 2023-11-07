import 'dart:developer';
import 'package:radioapp/pages/widgets/schedule_card.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ApiCall extends StatelessWidget {
  Future<List<dynamic>> fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get(
        'https://api.sr.se/v2/scheduledepisodes?channelid=132&format=json');
    log(response.data['schedule'].toString());

    return response.data['schedule'];
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
                  return 
                  // Card(
                  //     child: ListTile(
                  //   title: Text('${snapshot.data![index]['title']}'),
                  //   subtitle: Text('${snapshot.data![index]['description']}'),
                  // ));

                  ScheduleCard(
                    description: '${snapshot.data![index]['description']}',
                    end: '${snapshot.data![index]['endtimeutc']}',
                    start: '${snapshot.data![index]['starttimeutc']}',
                    imageurl: '${snapshot.data![index]['imageurl']}');
                 });
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
