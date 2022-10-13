import 'package:flutter/material.dart';
import 'package:flutteractual/common/const/colors.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(  // 모든 하위 뷰가 최대 높이만큼 가짐
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              8.0
            ),
            child: Image.asset(
              'assets/img/food/ddeok_bok_gi.jpg',
              width: 110,
              height: 110,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 8.0,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '떡볶이',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w500
                  ),
                ),
                Text(
                  '전통 떡볶이의 정석!\n맛있습니다!',
                  overflow: TextOverflow.ellipsis,  // maxLine을 넘어가는 줄에 대해서 ... 처리
                  maxLines: 2,
                  style: TextStyle(
                  color: BODY_TEXT_COLOR,
                  fontSize: 12.0,
                ),),
                Text(
                  '10000원',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: PRIMARY_COLOR,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w500
                ),)
              ],
            ),
          )
        ],
      ),
    );
  }
}
