import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_dimen.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/model/enum/category.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/ui/page/add_task/add_task_navigator.dart';
import 'package:todo_app/ui/page/add_task/add_task_provider.dart';
import 'package:todo_app/ui/page/add_task/widget/button_category.dart';
import 'package:todo_app/ui/widgets/app_text_form_field.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/utils/app_date_utils.dart';
import 'package:todo_app/utils/app_validator.dart';

class AddTaskPage extends StatelessWidget {
  final TodoEntity? todo;

  const AddTaskPage({super.key, this.todo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AddTaskProvider(
        todoRepo: context.read<TodoRepository>(),
        navigator: AddTaskNavigator(context: context),
      ),
      child: AddTaskChildPage(todo: todo),
    );
  }
}

class AddTaskChildPage extends StatefulWidget {
  final TodoEntity? todo;

  const AddTaskChildPage({super.key, this.todo});

  @override
  State<AddTaskChildPage> createState() => _AddTaskChildPageState();
}

class _AddTaskChildPageState extends State<AddTaskChildPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController taskTitleController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController timeController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<AddTaskProvider>();
      if (widget.todo != null) {
        TodoEntity todo = widget.todo!;
        provider.setTitleTask(todo.title);
        provider.setNotes(todo.notes);
        final date = AppDateUtils.toDateTime(todo.time!);
        final time = AppDateUtils.toTimeOfDay(date);
        provider.setDate(date);
        provider.setTime(time);
      }
      taskTitleController.text = provider.titleTask ?? "";
      notesController.text = provider.notes ?? "";
      dateController.text = AppDateUtils.formatDate(provider.date);
      timeController.text = AppDateUtils.formatTimeOfDayToString(provider.time);

      provider.setCategory(widget.todo?.category ?? Category.task);
    });
  }

  @override
  void dispose() {
    taskTitleController.dispose();
    dateController.dispose();
    timeController.dispose();
    notesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AddTaskProvider>();
    final titlePage = widget.todo != null ? "Edit Task" : S.of(context).title_add_new_task;
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context.read<AddTaskProvider>(), titlePage),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppDimen.paddingNormal),
              child: _buildAddFrom(context, provider),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppDimen.paddingNormal),
            child: ButtonPurple(
              onTap: () async {
                if (_formKey.currentState!.validate()) {
                  await provider.saveTask(todo: widget.todo);
                  provider.goBackHome(result: true);
                }
              },
              textButton: S.of(context).button_save,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddFrom(BuildContext context, AddTaskProvider provider) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppTextFormField(
            validator: (value) => AppValidator.validateEmpty(value),
            textLabel: S.of(context).label_task_title,
            hintText: S.of(context).hint_task_title,
            controller: taskTitleController,
            onChange: provider.setTitleTask,
          ),
          const SizedBox(height: 24),

          // Category row
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(S.of(context).label_category, style: AppTextStyle.bodyMedium),
              const SizedBox(width: 8),
              ButtonCategory(
                onTap: () {
                  provider.setCategory(Category.task);
                },
                icPosition: AppIcons.icCategoryTask,
                borderColor: provider.category == Category.task ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 16),
              ButtonCategory(
                onTap: () {
                  provider.setCategory(Category.goal);
                },
                icPosition: AppIcons.icCategoryGoal,
                borderColor: provider.category == Category.goal ? Colors.black : Colors.white,
              ),
              const SizedBox(width: 16),
              ButtonCategory(
                onTap: () {
                  provider.setCategory(Category.event);
                },
                icPosition: AppIcons.icCategoryEvent,
                borderColor: provider.category == Category.event ? Colors.black : Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Date & Time row
          Row(
            children: [
              Flexible(
                flex: 1,
                child: AppTextFormField(
                  validator: (value) => AppValidator.validateEmpty(value),
                  readOnly: true,
                  onTap: () async {
                    final date = await AppDateUtils.pickerDateShow(context, provider.date);
                    dateController.text = AppDateUtils.formatDate(date);
                    provider.setDate(date);
                  },
                  icPosition: AppIcons.icCalendar,
                  textLabel: S.of(context).label_date,
                  hintText: S.of(context).hint_date,
                  controller: dateController,
                ),
              ),
              const SizedBox(width: 8),
              Flexible(
                flex: 1,
                child: AppTextFormField(
                  validator: (value) => AppValidator.validateEmpty(value),
                  onTap: () async {
                    final time = await AppDateUtils.pickerTimeShow(context, provider.time);
                    timeController.text = AppDateUtils.formatTimeOfDayToString(time);
                    provider.setTime(time);
                  },
                  readOnly: true,
                  icPosition: AppIcons.icClock,
                  textLabel: S.of(context).label_time,
                  hintText: S.of(context).hint_time,
                  controller: timeController,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          AppTextFormField(
            isMultiLine: true,
            minLine: 5,
            keyboardType: TextInputType.multiline,
            textLabel: S.of(context).label_notes,
            hintText: S.of(context).hint_notes,
            controller: notesController,
            onChange: provider.setNotes,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildHeader(AddTaskProvider provider, String titleTask) {
    return Container(
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
                  provider.goBackHome(result: false);
                },
                icon: Image.asset(AppIcons.icButtonBack, width: 40, height: 40),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(titleTask, style: AppTextStyle.titleSmall, textAlign: TextAlign.center),
              ),
              const SizedBox(width: 40, height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
