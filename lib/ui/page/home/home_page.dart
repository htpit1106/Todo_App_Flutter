import 'package:flutter/material.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 222,
              width: MediaQuery.widthOf(context),
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.headerImg), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("October 20, 2022", style: AppTextStyle.titleSmall,),
                  SizedBox(height: 30,),
                  Text("My Todo List", style: AppTextStyle.titleApp,)
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 110, right: 16, left: 16),
              child: ListView(
              ),
            ),

          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(

              padding: const EdgeInsets.all(16.0),
              child: ButtonPurple(
                onTap: (){},
                textButton: "Add New Task",
              ),
            ),
          )
        ],
      ),
    );
  }
}
