import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteractual/common/const/data_key.dart';
import 'package:flutteractual/restaurant/component/restaurant_card.dart';
import 'package:flutteractual/restaurant/model/restaurant_model.dart';
import 'package:flutteractual/restaurant/view/restaurant_detail_screen.dart';

class RestaurantScreen extends StatelessWidget {
  const RestaurantScreen({Key? key}) : super(key: key);

  // 비딩 가능한 목록 Api 테스트
  // Future<List> paginateToday() async {
  //   final dio = Dio();
  //   final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
  //   final url = '$apiUrl$todayApi';
  //
  //   final response = await dio.get(
  //     url,   // url
  //     options: Options(
  //       headers: {  // 요청 헤더
  //         'Authorization' : accessToken
  //       }
  //     )
  //   );
  //
  //   print(response.data);
  //   return response.data['orders'];
  // }

  Future<List> loadRestaurantDataJson() async {
    final jsonData = await rootBundle.loadString('assets/foods.json');
    final data = await json.decode(jsonData);

    return data['foods'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FutureBuilder<List>(
            future: loadRestaurantDataJson(),
            builder: (context, AsyncSnapshot<List> snapshot) {
              if(!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.separated(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) {
                  final item = snapshot.data![index];
                  final parseItem = RestaurantModel.fromJson(
                    item
                  );

                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) =>
                          RestaurantDetailScreen(id: parseItem.id)
                        )
                      );
                    },
                    child: RestaurantCard.fromModel(
                      model: parseItem
                    ),
                  );
                },
                separatorBuilder: (_, index) {  // Divider
                  return SizedBox(height: 8.0);
                }
              );
            },
          )
        ),
      ),
    );
  }
}
