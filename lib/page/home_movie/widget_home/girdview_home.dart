import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo_01/controllers/home_controller.dart';
import 'package:test_demo_01/widget_movie/item_list_movie.dart';

class GirdViewHome extends StatelessWidget {
  const GirdViewHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      id: "listMovie",
      builder: (HomeController _homeController) {
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 18 / 26,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20
          ),
          itemCount: _homeController.countItemMax,
          itemBuilder: (context, index) => ItemListMovie(movie: _homeController.listDataMoviePage[index]));
      }
    );
  }
}
