import 'package:flutter/material.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';
import 'package:todo_app/generated/l10n.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeChildPage();
  }
}


class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomeChildPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 222,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(AppImages.headerImg),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("October 20, 2022", style: AppTextStyle.titleSmall),
                  SizedBox(height: 20),
                  Text(S.of(context).title_app, style: AppTextStyle.titleApp),
                ],
              ),
            ),
          ),

          Expanded(
            child: Transform.translate(
              offset: Offset(0, -50),
              child: Container(
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                  color: Colors.white,
                ),

                child: ListView(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  children: [for (int i = 0; i < 14; i++) TodoItem(
                    isCompleted: true,
                    titleTask: "Run 5k",
                    time: "4:00 pm",
                  )],
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ButtonPurple(onTap: () {}, textButton: S.of(context).button_add_new_task),
          ),
        ],
      ),
    );
  }
}
