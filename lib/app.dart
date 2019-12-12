import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;

import 'conf/ColorConf.dart';
import 'global_state/global_state.dart';
import 'global_state/global_store.dart';
import 'page/index/index_page.dart';
import 'page/login/login_page.dart';
import 'page/main/main_page.dart';
import 'page/register/page.dart';
import 'page/second/second_page.dart';
import 'page/web/web_page.dart';
import 'page/wechat_author/author_article_page/article_list_page.dart';
import 'page/wechat_author/author_page.dart';

/// 创建应用的根 Widget
/// 1. 创建一个简单的路由，并注册页面
/// 2. 对所需的页面进行和 AppStore 的连接
/// 3. 对所需的页面进行 AOP 的增强

class AppRoute {
  static AbstractRoutes _global;

  static AbstractRoutes get global {
    if (_global == null) {
      _global = PageRoutes(
        pages: <String, Page<Object, dynamic>>{
          /// 首页
          'home': MainPage(),

          /// 登录页面
          'login': LoginPage(),

          /// 注册页面
          'register': RegisterPage(),

          /// 首页的第二个tab
          'second': SecondPage(),

          /// 首页的第一个tab
          'index': IndexPage(),

          /// webView页面
          'webView': WebLoadPage(),

          /// 微信公众号列表页面
          'wechat_author': AuthorPage(),

          /// 微信公众号文章列表页面
          'wechat_author_article': AuthorArticlePage()
        },
        visitor: (String path, Page<Object, dynamic> page) {
          /// 只有特定的范围的 Page 才需要建立和 AppStore 的连接关系
          /// 满足 Page<T> ，T 是 GlobalBaseState 的子类
          if (page.isTypeof<GlobalBaseState>()) {
            /// 建立 AppStore 驱动 PageStore 的单向数据连接
            /// 1. 参数1 AppStore
            /// 2. 参数2 当 AppStore.state 变化时, PageStore.state 该如何变化
            page.connectExtraStore<GlobalState>(GlobalStore.store,
                (Object pageState, GlobalState appState) {
              final GlobalBaseState p = pageState;
//              if (p.themeColor != appState.themeColor &&
//                  p.ifLogin != appState.ifLogin) {
                if (pageState is Cloneable) {
                  print('修改--进行复制');
                  final Object copy = pageState.clone();
                  final GlobalBaseState newState = copy;
                  newState.themeColor = appState.themeColor;
                  newState.ifLogin = appState.ifLogin;
                  newState.screenH = appState.screenH;
                  newState.screenW = appState.screenW;
                  return newState;
//                }
              }
              return pageState;
            });
          }

          /// AOP
          /// 页面可以有一些私有的 AOP 的增强， 但往往会有一些 AOP 是整个应用下，所有页面都会有的。
          /// 这些公共的通用 AOP ，通过遍历路由页面的形式统一加入。
          page.enhancer.append(
            /// View AOP
            viewMiddleware: <ViewMiddleware<dynamic>>[
              safetyView<dynamic>(),
            ],

            /// Adapter AOP
            adapterMiddleware: <AdapterMiddleware<dynamic>>[
              safetyAdapter<dynamic>()
            ],

            /// Effect AOP
            effectMiddleware: <EffectMiddleware<dynamic>>[
              _pageAnalyticsMiddleware<dynamic>(),
            ],

            /// Store AOP
            middleware: <Middleware<dynamic>>[
              logMiddleware<dynamic>(tag: page.runtimeType.toString()),
            ],
          );
        },
      );
    }
    return _global;
  }
}

Widget createApp() {
  final AbstractRoutes routes = AppRoute.global;

  return MaterialApp(
    title: '玩安卓',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: ColorConf.themeColor,
    ),
    home: routes.buildPage('home', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
