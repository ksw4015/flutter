import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutteractual/restaurant/model/order_model.dart';
import 'package:retrofit/retrofit.dart';

part 'order_repository.g.dart';

@RestApi()
abstract class OrderRepository {
  // baseUrl = apiUrl

  factory OrderRepository(Dio dio, {String baseUrl})
    = _OrderRepository;

  @GET('bids/available/today?v=2')
  Future<OrderResponse> getOrderAvailableToday();

  // @GET('orders/{orderId}?v=2')
  // Future<DetailOrderResponse> getOrderDetail({@Path() required String orderId});
}