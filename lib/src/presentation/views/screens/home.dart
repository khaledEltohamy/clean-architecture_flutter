import 'package:api_book/src/presentation/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.obx(
          (state) => ListView.builder(
              itemCount: state!.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Text("${state[index].author}"),
                );
              }),
          onEmpty: Center(
            child: Text("isEmpty"),
          ),
          onError: (e) => Center(
                child: Text("isError ${e.toString()}"),
              ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          )),
    );
  }
}
