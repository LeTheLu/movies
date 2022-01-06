import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_demo_01/models/model_movie.dart';
import 'package:test_demo_01/service/service.dart';

class HomeController extends GetxController {
   int page = 1;
   late String urlMovie;

  ScrollController scrollControllerList = ScrollController();
  String urlImg = "https://www.themoviedb.org/t/p/w600_and_h900_bestv2";
  List<Results> listDataMoviePage = [];
  int countItemMax = 10;

  bool loadingList = false;
  bool loadMoreList = false;

  getDataInit() async {
    loadingList = true;
    update(["listMovie"]);
    listDataMoviePage = await NetWork.getDataInit(urlMovie: urlMovie );
    if (listDataMoviePage.isEmpty) {
    } else {
      loadingList = false;
      update(["listMovie"]);
    }
    countItemMax =
        listDataMoviePage.length >= 10 ? 10 : listDataMoviePage.length;
    update(["listMovie"]);
  }

  Future resetList() async {
    page = 1;
    pages();
    getDataInit();
  }
  pages(){
    urlMovie = "https://api.themoviedb.org/3/discover/movie?api_key=26763d7bf2e94098192e629eb975dab0&page=$page";
  }

  Future loadMore() async {
    if (listDataMoviePage.length > countItemMax) {
      loadMoreList = true;
      update();
      countItemMax = listDataMoviePage.length >= 20 ? countItemMax + 10 : countItemMax + listDataMoviePage.length;
      update(["listMovie"]);
      Future.delayed(const Duration(seconds: 1),(){
        loadMoreList = false;
        update();
      });
    }else{
      page = ++ page;
      pages();
      List<Results> listMore = await NetWork.getDataInit(urlMovie: urlMovie);
      listDataMoviePage.addAll(listMore);
      loadMore();
    }
  }

  @override
  void onInit() async {
    pages();
    // TODO: implement onInit
    await getDataInit();
    scrollControllerList.addListener(() {
      if (scrollControllerList.position.pixels ==
          scrollControllerList.position.maxScrollExtent) {
        loadMore();
      }
    });
    super.onInit();
  }
}
