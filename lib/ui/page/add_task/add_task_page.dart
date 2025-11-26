import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_dimen.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/model/enum/category.dart';
import 'package:todo_app/ui/page/add_task/add_task_navigator.dart';
import 'package:todo_app/ui/page/add_task/widget/button_category.dart';
import 'package:todo_app/ui/page/add_task/widget/labeled_text_form_field.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/utils/app_validator.dart';

import '../../../utils/app_date_utils.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AddTaskChildPage();
  }
}

class AddTaskChildPage extends StatefulWidget {
  const AddTaskChildPage({super.key});

  @override
  State<AddTaskChildPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskChildPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();
  Category category = Category.task;
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  late final AddTaskNavigator _navigator;
  late final HomeProvider _homeProvider;
  String? titlePage;

  // todo detail
  TodoEntity? todo;

  @override
  void initState() {
    _navigator = AddTaskNavigator(context: context);
    _homeProvider = context.read<HomeProvider>();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getTodo();
    });
  }

  void _getTodo() async {
    final extra = GoRouterState
        .of(context)
        .extra;
    // convert

    if (extra != null && extra is Map<String, dynamic>) {
      setState(() {
        todo = extra['todo'];
        taskTitleController.text = todo!.title ?? '';
        dateController.text = todo!.time != null ? AppDateUtils.formatDate(DateTime.parse(todo!.time!)) : '';
        category = todo!.category!;
        notesController.text = todo!.notes!;
        titlePage = "Edit Task";

        if (todo!.time != null) {
          date = AppDateUtils.toDateTime(todo!.time!);
          time = AppDateUtils.toTimeOfDay(date);
          timeController.text = AppDateUtils.stringToOclock(todo!.time!);
        }

        // kieu tra ve la String iso 86
        // tao ra TimeOfDay -> format dang h
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        spacing: 24,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(AppImages.headerImg), fit: BoxFit.cover),
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        _navigator.backToHome();
                      },
                      icon: Image.asset(AppIcons.icButtonBack, width: 40, height: 40),
                    ),

                    Expanded(
                      child: Text(
                        titlePage ?? S
                            .of(context)
                            .title_add_new_task,
                        style: AppTextStyle.titleSmall,
                        textAlign: TextAlign.center,
                      ),
                    ),

                    SizedBox(width: 40, height: 40),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimen.paddingNormal),
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
                              validator: (value) => AppValidator.validateEmpty(value),
                              textLabel: S
                                  .of(context)
                                  .label_task_title,
                              hintText: S
                                  .of(context)
                                  .hint_task_title,
                              controller: taskTitleController,
                            ),
                            Row(
                              spacing: 16,
                              children: [
                                Text(S
                                    .of(context)
                                    .label_category, style: AppTextStyle.bodyMedium),
                                SizedBox(width: 8),
                                ButtonCategory(
                                  onTap: () {
                                    category = Category.task;
                                    setState(() {});
                                  },
                                  icPosition: AppIcons.icCategoryTask,
                                  borderColor: category == Category.task ? Colors.black : Colors.white,
                                ),
                                ButtonCategory(
                                  onTap: () {
                                    category = Category.goal;
                                    setState(() {});
                                  },
                                  icPosition: AppIcons.icCategoryGoal,
                                  borderColor: category == Category.goal ? Colors.black : Colors.white,
                                ),
                                ButtonCategory(
                                  onTap: () {
                                    category = Category.event;
                                    setState(() {});
                                  },
                                  icPosition: AppIcons.icCategoryEvent,
                                  borderColor: category == Category.event ? Colors.black : Colors.white,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    validator: (value) => AppValidator.validateEmpty(value),
                                    readOnly: true,
                                    onTap: () async {
                                      date = await AppDateUtils.pickerDateShow(context, date);
                                      dateController.text = AppDateUtils.formatDate(date);
                                    },
                                    icPosition: AppIcons.icCalendar,
                                    textLabel: S
                                        .of(context)
                                        .label_date,
                                    hintText: S
                                        .of(context)
                                        .hint_date,
                                    controller: dateController,
                                  ),
                                ),
                                SizedBox(width: 8),

                                Flexible(
                                  flex: 1,
                                  child: LabeledTextFormField(
                                    validator: (value) => AppValidator.validateEmpty(value),
                                    onTap: () async {
                                      time = await AppDateUtils.pickerTimeShow(context, time);
                                      timeController.text = AppDateUtils.formatTimeOfDayToString(time);
                                    },
                                    readOnly: true,
                                    icPosition: AppIcons.icClock,
                                    textLabel: S
                                        .of(context)
                                        .label_time,
                                    hintText: S
                                        .of(context)
                                        .hint_time,
                                    controller: timeController,
                                  ),
                                ),
                              ],
                            ),

                            LabeledTextFormField(
                              isMultiLine: true,
                              minLine: 5,
                              keyboardType: TextInputType.multiline,
                              textLabel: S
                                  .of(context)
                                  .label_notes,
                              hintText: S
                                  .of(context)
                                  .hint_notes,
                              controller: notesController,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: ButtonPurple(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          onSave();
                        }
                      },
                      textButton: "Save",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void updateTask() {

  }

  void onSave() async {
    final day = AppDateUtils.dateToStringISO8601(date, time);
    TodoEntity newTodo = TodoEntity(
        id: todo?.id,
        isCompleted: todo?.isCompleted ?? false,
        category: category,
        createdAt: DateTime.now().toIso8601String(),
        title: taskTitleController.text,
        notes: notesController.text,
        time: day,
        userId: todo?.userId
    );
    _navigator.backToHome();
    todo != null ? await _homeProvider.updateTodo(todo!.id!, newTodo) :
    await _homeProvider.addNewTask(newTodo);
  }
}
