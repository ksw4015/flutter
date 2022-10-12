import 'package:flutter/material.dart';
import 'package:flutteractual/common/layout/default_layout.dart';
import 'package:flutteractual/restaurant/component/restaurant_card.dart';

class RestaurantDetailScreen extends StatelessWidget {


  const RestaurantDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '불타는 떡볶이',
      child: Column(
        children: [
          RestaurantCard(
            image: Image.asset('assets/img/food/ddeok_bok_gi.jpg'),
            name: '불타는 떡볶이',
            tags: ['떡볶이', '매운맛', '빨간색'],
            ratingCount: 100,
            deliveryTime: 15,
            deliveryFee: 2000,
            rating: 4.52,
            isDetail: true,
          )
        ],
      ),
    );
  }
}
