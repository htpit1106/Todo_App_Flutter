import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/model/entities/todo_entity.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/utils/app_date_utils.dart';
import '../../../common/app_dimen.dart';
import '../../../model/enum/category.dart';
import 'home_navigator.dart';

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
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    setState(() {
      isLoading = true;
    });
    final homeProvider = context.read<HomeProvider>();
    await homeProvider.loadTodos();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    late final navigator = HomeNavigator(context: context);

    final unCompletedTodos = homeProvider.unCompletedTodos;
    final completedTodos = homeProvider.completedTodos;

    return Scaffold(
      body: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: 222,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage(AppImages.headerImg), fit: BoxFit.cover),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppDateUtils.formatDateNow(DateTime.now()), style: AppTextStyle.titleSmall),
                  SizedBox(height: 20),
                  Text(S.of(context).title_app, style: AppTextStyle.titleApp),
                ],
              ),
            ),
          ),
          isLoading
              ? Expanded(child: Center(child: CircularProgressIndicator()))
              : _buildSuccessList(unCompletedTodos, completedTodos, homeProvider, navigator),
          Padding(
            padding: const EdgeInsets.all(AppDimen.paddingNormal),
            child: ButtonPurple(
              onTap: () {
                navigator.openNewTaskPage();
              },
              textButton: S.of(context).button_add_new_task,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessList(
    List<TodoEntity> unCompletedTodos,
    List<TodoEntity> completedTodos,
    HomeProvider homeProvider,
    HomeNavigator navigator,
  ) {
    final items = [...unCompletedTodos, if (completedTodos.isNotEmpty) "header", ...completedTodos];
    final totalItemCount = unCompletedTodos.length + (completedTodos.isNotEmpty ? completedTodos.length + 1 : 0);
    return Expanded(
      child: Transform.translate(
        offset: Offset(0, -50),
        child: Container(
          margin: EdgeInsets.all(AppDimen.marginSmall),
          child: (unCompletedTodos.isEmpty && completedTodos.isEmpty)
              ? Center(child: Text("List is empty"))
              : ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: AppDimen.paddingNormal),

                  itemCount: totalItemCount,
                  itemBuilder: (BuildContext context, int index) {
                    final item = items[index];
                    if (item == "header") {
                      return Padding(
                        padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
                        child: Text("Completed", style: AppTextStyle.bodyMedium),
                      );
                    }
                    final todo = item as TodoEntity;
                    final currentList = todo.isCompleted ? completedTodos : unCompletedTodos;
                    final currentIndex = currentList.indexOf(item);
                    return TodoItem(
                      onTap: () {
                        navigator.openDetailTask(todo);
                      },
                      onDismissed: () async {
                        await homeProvider.deleteTask(todo.id!);
                      },
                      id: todo.id,
                      isCompleted: item.isCompleted,
                      titleTask: item.title,

                      time: AppDateUtils.stringToOclock(todo.time ?? DateTime.now().toString()),
                      borderRadius: AppDimen.getBorderRadius(currentIndex, currentList),
                      toggleCompleteStatus: () {
                        homeProvider.toggleCompleted(item.id!, item.isCompleted);
                      },
                      iconPath: getIcPath(item.category ?? Category.task),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
