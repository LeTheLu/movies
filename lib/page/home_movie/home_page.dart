import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:test_demo_01/controllers/home_controller.dart';
import 'package:test_demo_01/page/home_movie/widget_home/girdview_home.dart';
import 'package:test_demo_01/widget_movie/appbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back_ios,
          color: Colors.black,
        ),
      ),*/
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: GetBuilder<HomeController>(
                      builder: (HomeController _homeController) {
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            RefreshIndicator(
                              onRefresh: () async {
                                _homeController.resetList();
                              },
                              child: SingleChildScrollView(
                                controller: _homeController.scrollControllerList,
                                padding: EdgeInsets.zero,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    //title
                                    const Padding(
                                      padding: EdgeInsets.only(bottom: 20),
                                      child: Text(
                                        "Popular list",
                                        style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    //gridview
                                    GetBuilder<HomeController>(
                                      id: "listMovie",
                                      builder: (controller) => controller.loadingList
                                          ? const Center(
                                        child: CircularProgressIndicator(),
                                      )
                                          : const GirdViewHome(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              child: Visibility(
                                  visible: _homeController.loadMoreList,
                                  child: const CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: CircularProgressIndicator(color: Colors.blue,strokeWidth: 5,),
                                  )),
                            )
                          ],
                        );
                      }),
                ),
                Positioned(
                    child: AppBarMovie(onTapLeading: () {}, leadingTitle: 'Back',))
              ],
            )),
      ),
    );
  }
}
