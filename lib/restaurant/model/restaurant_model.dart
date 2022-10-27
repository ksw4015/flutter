import 'package:flutteractual/common/utils/data_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'restaurant_model.g.dart';

enum RestaurantPriceRange {
  high, medium, low
}

@JsonSerializable()  // 적용 후 터미널에서 명령어 실행 'flutter pub run build_runner build'
class RestaurantModel {
  final String id;
  final String name;
  // 변수 위에 JsonKey 어노테이션 선언 시 직렬화 과정에서 지정한 함수 실행 가능
  @JsonKey(
    fromJson: DataUtils.pathToUrl  // 파라미터 없이 함수명만 입력
  )
  final String thumbUrl;
  final List<String> tags;
  final RestaurantPriceRange priceRange;
  final double ratings;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;

  RestaurantModel({
    required this.id,
    required this.name,
    required this.thumbUrl,
    required this.tags,
    required this.priceRange,
    required this.ratings,
    required this.ratingsCount,
    required this.deliveryTime,
    required this.deliveryFee,
  });

  factory RestaurantModel.fromJson(Map<String, dynamic> json) =>
      _$RestaurantModelFromJson(json);

  Map<String, dynamic> toJson() =>
      _$RestaurantModelToJson(this);

}