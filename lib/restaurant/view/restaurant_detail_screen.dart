import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutteractual/common/layout/default_layout.dart';
import 'package:flutteractual/restaurant/component/restaurant_card.dart';
import 'package:flutteractual/restaurant/model/restaurant_detail_model.dart';

import '../component/product_card.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final String id;

  const RestaurantDetailScreen({
    required this.id,
    Key? key
  }) : super(key: key);

  // Api 요청은 RestaurantScreen 주석된 코드 참고
  Future<Map<String, dynamic>> getRestaurantDetail() async {
    final jsonData = await rootBundle.loadString('assets/food_detail.json');
    final data = await json.decode(jsonData);
    final List foods = data['foods'];
    return foods.firstWhere((element) => element['id'] == id);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: FutureBuilder<Map<String, dynamic>>(
        future: getRestaurantDetail(),
        builder: (_, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if(!snapshot.hasData) {
            return Container();
          }

          final detailItem = RestaurantDetailModel.fromJson(
            snapshot.data!,
          );

          return CustomScrollView(   // Flutter의 ListView는 CustomScrollView + SliverList로 만들어졌다.
            slivers: [
              // 이란 위젯을 넣기 위해서 필요한 어댑터 클래스
              renderTop(model: detailItem),
              renderLabel(),
              renderProducts()
            ],
          );
        },
      )
    );
  }

  SliverPadding renderLabel() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverToBoxAdapter(
        child: Text(
          '메뉴',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500
          ),
        ),
      ),
    );
  }

  SliverPadding renderProducts() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      sliver: SliverList(   //
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: ProductCard(),
            );
          },
          childCount: 10,
        ),
      ),
    );
  }

  SliverToBoxAdapter renderTop({
    required RestaurantDetailModel model
  }) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          RestaurantCard.fromModel(
            model: model,
            isDetail: true,
          ),
          SizedBox(height: 16.0,)
        ],
      ),
    );
  }

}
