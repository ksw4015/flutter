import 'package:json_annotation/json_annotation.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderResponse {
  final bool success;
  final int code;
  final String msg;
  final List<Order> orders;

  OrderResponse({
    required this.success,
    required this.code,
    required this.msg,
    required this.orders
  });

  factory OrderResponse.fromJson(Map<String, dynamic> json)
  => _$OrderResponseFromJson(json);
}

@JsonSerializable()
class Order {
  final int id;
  final bool bid;
  final Destination departure;
  final Destination destination;
  final Price prices;
  final int totalDistance;
  final int waypoints;
  final Item item;
  final List<String> avoidancePartners;
  final List<String> options;

  Order({
    required this.id,
    required this.bid,
    required this.departure,
    required this.destination,
    required this.prices,
    required this.totalDistance,
    required this.waypoints,
    required this.item,
    required this.avoidancePartners,
    required this.options
  });
  
  factory Order.fromJson(Map<String, dynamic> json) 
  => _$OrderFromJson(json);
}

@JsonSerializable()
class Destination {
  final String dongName;
  final String pickupTime;
  final List<double> coords;
  final SubwayInfo subwayInfo;

  Destination({
    required this.dongName,
    required this.pickupTime,
    required this.coords,
    required this.subwayInfo
  });

  factory Destination.fromJson(Map<String, dynamic> json)
  => _$DestinationFromJson(json);
}

@JsonSerializable()
class SubwayInfo {
  final String name;
  final String fontColor;
  final String bgColor;
  final int distance;

  SubwayInfo({
    required this.name,
    required this.fontColor,
    required this.bgColor,
    required this.distance
  });

  factory SubwayInfo.fromJson(Map<String, dynamic> json)
  => _$SubwayInfoFromJson(json);
}

@JsonSerializable()
class Price {
  final int price;
  final int point;

  Price({
    required this.price,
    required this.point
  });

  factory Price.fromJson(Map<String, dynamic> json)
  => _$PriceFromJson(json);
}

@JsonSerializable()
class Item {
  final bool fragile;
  final int document;
  final int smallBox;
  final int bigBox;
  final String etc;
  final int weight;

  Item({
    required this.fragile,
    required this.document,
    required this.smallBox,
    required this.bigBox,
    required this.etc,
    required this.weight
  });

  factory Item.fromJson(Map<String, dynamic> json)
  => _$ItemFromJson(json);
}