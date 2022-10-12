import 'package:flutter/material.dart';
import 'package:flutteractual/common/const/colors.dart';
import 'package:flutteractual/restaurant/model/restaurant_model.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  final List<String> tags;
  final int ratingCount;
  final int deliveryTime;
  final int deliveryFee;
  final double rating;
  final bool isDetail;

  const RestaurantCard({
    required this.image,
    required this.name,
    required this.tags,
    required this.ratingCount,
    required this.deliveryTime,
    required this.deliveryFee,
    required this.rating,
    this.isDetail = false,
    Key? key
  }) : super(key: key);

  factory RestaurantCard.fromModel({
    required RestaurantModel model,
    bool isDetail = false
  }) {
    return RestaurantCard(
      image: Image.asset(
        model.thumbUrl,
        fit: BoxFit.cover,
      ),
      name: model.name,
      tags: model.tags,
      ratingCount: model.ratingsCount,
      deliveryTime: model.deliveryTime,
      deliveryFee: model.deliveryFee,
      rating: model.ratings,
      isDetail: isDetail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if(isDetail)
           image
        else
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: image,
          )
        ,
        const SizedBox(height: 16.0),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: isDetail ? 16.0 : 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                tags.join(' · '),
                style: TextStyle(
                    color: BODY_TEXT_COLOR,
                    fontSize: 14.0
                ),
              ),
              Row(
                children: [
                  _IconText(
                    icon: Icons.star,
                    label: rating.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.receipt,
                    label: ratingCount.toString(),
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.timelapse_outlined,
                    label: '$deliveryTime 분',
                  ),
                  renderDot(),
                  _IconText(
                    icon: Icons.monetization_on,
                    label: '${deliveryFee == 0 ? '무료' : deliveryFee.toString()}',
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  renderDot() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        '·',
        style: TextStyle(
          fontSize: 12.0,
          fontWeight: FontWeight.w500
        ),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({
    required this.icon,
    required this.label,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(width: 4.0),
        Text(
          label,
          style: TextStyle(
            fontSize: 12.0,
            fontWeight: FontWeight.w500
          ),
        )
      ],
    );
  }
}

