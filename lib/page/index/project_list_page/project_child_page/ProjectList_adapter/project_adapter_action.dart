import 'package:fish_redux/fish_redux.dart';
import 'package:flutter_android_fun/domain/entity/ProjectSingleListBean.dart';

//TODO replace with your own action
enum ProjectListAction {
  action,
 
}

class ProjectListActionCreator {
  static Action onAction() {
    return const Action(ProjectListAction.action);
  }


}
