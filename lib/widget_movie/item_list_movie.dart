import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_demo_01/controllers/home_controller.dart';
import 'package:test_demo_01/models/model_movie.dart';


class ItemListMovie extends StatelessWidget {
  final Results movie;


  ItemListMovie({Key? key, required this.movie}) : super(key: key);

  final _homeController = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 4,
              offset: const Offset(0,5),
            )
          ]),
      child: Stack(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(_homeController.urlImg + (movie.backdropPath ?? movie.posterPath??""),
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                width: 180,
                height: 260,fit: BoxFit.cover,)),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                 Text(
                   movie.releaseDate.toString().substring(0,4),
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
                SizedBox(
                  width: 170,
                  child: Wrap(direction: Axis.horizontal, children: [
                    Text(movie.title!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600)),
                  ]),
                )
              ],
            ),
          ),
          Positioned(
              top: 10,
              right: 10,
              child: ClipOval(
                child: Container(
                  alignment: Alignment.center,
                  height: 35,
                  width: 35,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomCenter,
                          colors: [
                        Colors.orange,
                        Colors.pink,
                      ])),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movie.voteAverage.toString().substring(0,1),
                        style: const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      Text(movie.voteAverage.toString().substring(1),
                          style: const TextStyle(color: Colors.white, fontSize: 12))
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
