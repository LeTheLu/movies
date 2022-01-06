import 'package:flutter/material.dart';

class AppBarMovie extends StatelessWidget {
  final String leadingTitle;
  final VoidCallback onTapLeading;

  const AppBarMovie({Key? key, required this.leadingTitle,required this.onTapLeading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Ink(
            height: 30,
            width: 80,
            decoration: const BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
            child: InkWell(
              splashColor: Colors.grey,
              borderRadius: const BorderRadius.all(Radius.circular(5)),
              onTap: (){
                onTapLeading.call();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.arrow_back_ios),
                  Text(leadingTitle, style: const TextStyle(color: Colors.black, fontSize: 19),),
                ],
              ),
            ),
          ),
          const Flexible(child: SizedBox(),)
        ],
      )
    );
  }
}
