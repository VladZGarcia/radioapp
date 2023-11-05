import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';


class ApiCall extends StatelessWidget {
  // Future<List<dynamic>> 
  fetchAPI() async {
    Dio dio = Dio();

    var response = await dio.get('https://api.sr.se/api/v2/channels');
    log(response.data.toString());

    return response.data;
  }

  @override
  Widget build(BuildContext context) {
    return Text('');
    // FutureBuilder<List<dynamic>>(
    //     future: fetchAPI(),
    //     builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    //       if (snapshot.hasData) {
    //         return Text(snapshot.data.toString());
    //       } else {
    //         return Center(child: CircularProgressIndicator());
    //       }
    //     });
  }
}
