import 'package:flutter/material.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/ui/page/add_task/widget/button_category.dart';
import 'package:todo_app/ui/page/add_task/widget/labeled_text_form_field.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';

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
        spacing: 24,
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
                      S.of(context).title_add_new_task,
                      style: AppTextStyle.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            // padding: const EdgeInsets.all(16.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          spacing: 24,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabeledTextFormField(
                              textLabel: S.of(context).label_task_title,
                              hintText: S.of(context).hint_task_title,
                              controller: taskTitleController,
                            ),
                            Row(
                              spacing: 16,
                              children: [
                                Text(
                                  S.of(context).label_category,
                                  style: AppTextStyle.bodyMedium,
                                ),
                                SizedBox(width: 24),
                                ButtonCategory(
                                  icPosition: AppIcons.icCategoryTask,
                                  borderColor: Colors.black,
                                ),
                                ButtonCategory(
                                  icPosition: AppIcons.icCategoryGoal,
                                ),
                                ButtonCategory(
                                  icPosition: AppIcons.icCategoryEvent,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    icPosition: AppIcons.icCalendar,
                                    textLabel: S.of(context).label_date,
                                    hintText: S.of(context).hint_date,
                                    controller: taskTitleController,
                                  ),
                                ),
                                SizedBox(width: 8),

                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    icPosition: AppIcons.icClock,
                                    textLabel: S.of(context).label_time,
                                    hintText: S.of(context).hint_time,
                                    controller: taskTitleController,
                                  ),
                                ),
                              ],
                            ),

                            LabeledTextFormField(
                              isMultiLine: true,
                              minLine: 5,
                              keyboardType: TextInputType.multiline,
                              textLabel: S.of(context).label_notes,
                              hintText: S.of(context).hint_notes,
                              controller: taskTitleController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonPurple(onTap: () {}, textButton: "Save"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
