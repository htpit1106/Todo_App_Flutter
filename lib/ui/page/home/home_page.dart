import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/common/app_dimen.dart';
import 'package:todo_app/common/app_icons.dart';
import 'package:todo_app/common/app_images.dart';
import 'package:todo_app/common/app_text_style.dart';
import 'package:todo_app/repository/auth_repository.dart';
import 'package:todo_app/repository/todo_repository.dart';
import 'package:todo_app/ui/loading/app_loading_indicator.dart';
import 'package:todo_app/ui/page/home/home_provider.dart';
import 'package:todo_app/ui/widgets/button_purple.dart';
import 'package:todo_app/ui/widgets/todo_item.dart';
import 'package:todo_app/generated/l10n.dart';
import 'package:todo_app/utils/app_date_utils.dart';
import 'home_navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return HomeProvider(
          authRepo: context.read<AuthRepository>(),
          todoRepo: context.read<TodoRepository>(),
          navigator: HomeNavigator(context: context),
        );
      },
      child: HomeChildPage(),
    );
  }
}

// dependency injection

class HomeChildPage extends StatefulWidget {
  const HomeChildPage({super.key});

  @override
  State<HomeChildPage> createState() => _HomePageState();
}

class _HomePageState extends State<HomeChildPage> with RouteAware {

   late final HomeProvider homeProvider;

  @override
  void initState() {
    super.initState();
     homeProvider = context.read<HomeProvider>();
    homeProvider.loadListTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(context, homeProvider),

          Consumer<HomeProvider>(
            builder: (context, value, child) {
              return value.isLoading
                  ? Expanded(child: Center(child: AppCircularProgressIndicator()))
                  : _buildSuccessList(context);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(AppDimen.paddingNormal),
            child: ButtonPurple(
              onTap: () {
                context.read<HomeProvider>().onPressAddTaskBtn();
              },
              textButton: S.of(context).button_add_new_task,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, HomeProvider provider) {
    return Container(
      height: 222,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(AppImages.headerImg), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
              onPressed: () {
                provider.logout();
              },
              icon: Image.asset(AppIcons.icLogout, width: 24, height: 24,),
            ),
          ),
          Text(AppDateUtils.formatDateNow(DateTime.now()), style: AppTextStyle.titleSmall),
          SizedBox(height: 20),
          Text(S.of(context).title_app, style: AppTextStyle.titleApp),
        ],
      ),
    );
  }

  Widget _buildSuccessList(BuildContext context) {
    final homeProvider = context.watch<HomeProvider>();
    final unCompletedTodos = homeProvider.getUnCompletedTodos;
    final completedTodos = homeProvider.getCompletedTodos;
    return Expanded(
      child: Transform.translate(
        offset: Offset(0, -50),
        child: Container(
          margin: EdgeInsets.all(AppDimen.marginNormal),
          child: (unCompletedTodos.isEmpty && completedTodos.isEmpty)
              ? Center(child: Text(S.of(context).label_list_empty, style: AppTextStyle.bodyMedium))
              : CustomScrollView(
                  slivers: [
                    // uncompleted list
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final todo = unCompletedTodos[index];
                        final currentList = todo.isCompleted ? completedTodos : unCompletedTodos;
                        final currentIndex = currentList.indexOf(todo);
                        return TodoItem(
                          todo: todo,
                          borderRadius: AppDimen.getBorderRadius(currentIndex, currentList.length),
                          onTap: () => homeProvider.onPressItem(todo),
                          onDismissed: () => homeProvider.deleteTask(todo.id!),
                          toggleCompleteStatus: () => homeProvider.toggleCompleted(todo.id!, todo.isCompleted),
                        );

                      }, childCount: unCompletedTodos.length),
                    ),

                    // header
                    if (completedTodos.isNotEmpty)
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: AppDimen.paddingNormal),
                          child: Text(
                            S.of(context).label_completed,
                            style: unCompletedTodos.isEmpty ? AppTextStyle.titleSmall : AppTextStyle.bodyMedium,
                          ),
                        ),
                      ),

                    // completedTodos
                    SliverList(
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final todo = completedTodos[index];
                        final currentList = todo.isCompleted ? completedTodos : unCompletedTodos;
                        final currentIndex = currentList.indexOf(todo);
                        return TodoItem(
                          todo: todo,
                          borderRadius: AppDimen.getBorderRadius(currentIndex, currentList.length),
                          onTap: () => homeProvider.onPressItem(todo),
                          onDismissed: () => homeProvider.deleteTask(todo.id!),
                          toggleCompleteStatus: () => homeProvider.toggleCompleted(todo.id!, todo.isCompleted),
                        );

                      }, childCount: completedTodos.length),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
