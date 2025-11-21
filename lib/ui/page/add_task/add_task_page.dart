import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/ui/page/add_task/widget/labeled_text_form_field.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({super.key});

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing:  24,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImages.headerImg),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Image.asset(AppIcons.icButtonBack, width: 40, height: 40),
                    SizedBox(width: 100),
                    Text(
                      "Add New Task",
                      style: AppTextStyle.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LabeledTextFormField(
                  textLabel: "Task Title",
                  hintText: "Date ",
                  controller: taskTitleController,
                ),
                Text("Category"),
                Row(
                  children: [
                    Flexible(
                      flex: 1,
                      child: LabeledTextFormField(
                        textLabel: "Date",
                        hintText: "Date ",
                        controller: taskTitleController,
                      ),
                    ),

                    Flexible(
                      flex: 1,
                      child: LabeledTextFormField(
                        textLabel: "Time ",
                        hintText: "Time ",
                        controller: taskTitleController,
                      ),
                    ),

                  ],
                )


              ],
            ),
          ),
        ],
      ),
    );
  }
}
