import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutteractual/common/const/data_key.dart';
import 'package:flutteractual/common/layout/default_layout.dart';
import 'package:flutteractual/restaurant/model/order_model.dart';
import 'package:flutteractual/restaurant/repository/order_repository.dart';

class OrderListScreen extends StatelessWidget {

  const OrderListScreen({Key? key}) : super(key: key);

  Future<OrderResponse> getOrderToday() async {
    // Get saved AccessToken
    final accessToken = await storage.read(key: ACCESS_TOKEN_KEY);
    // Create Dio Instance
    final dio = Dio();
    // Add Headers
    dio.options.headers['Authorization'] = accessToken;
    // Create Order Repository Instance
    final orderRepo = OrderRepository(dio, baseUrl: apiUrl);

    return orderRepo.getOrderAvailableToday();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      title: '오더 목록',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<OrderResponse>(
            future: getOrderToday(),
            builder: (context, AsyncSnapshot<OrderResponse> snapshot) {
              if(snapshot.hasError) { // 400 ~ 500
                return Center(
                  child: Text(
                    snapshot.error.toString()
                  ),
                );
              }

              if(!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data!.orders.length,
                itemBuilder: ((context, index) {
                  return Center(
                    child: Text('Order: ${snapshot.data!.orders[index].id}'),
                  );
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
