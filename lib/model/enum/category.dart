import '../../common/app_icons.dart';

enum Category { task, event, goal }

String getIcPath(Category category) {
  switch (category) {
    case Category.task:
      return AppIcons.icCategoryTask;
    case Category.event:
      return AppIcons.icCategoryEvent;
    case Category.goal:
      return AppIcons.icCategoryGoal;
  }
}
