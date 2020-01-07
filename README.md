[toc]
# FishRedux完成一个玩安卓客户端

## 前言
 不知不觉从18年接触Flutter断断续续到现在，说是一直在玩，其实接触得也都很浅~
 实际说起来，貌似自己一点都不懂...
 虽然自己断断续续也写了一些app：
[玩安卓](https://github.com/LinHuanTanLy/FlutterWanAndroid)
[钢铁直男版](https://github.com/LinHuanTanLy/TuneAndroid)
也在公司app上集成了一个单页面的flutter首页
[捂脸] 但是说实话我自己都不想去玩，好垃圾~

所以才会想在年底比较闲的时候，做出一个至少我愿意装在我手机上的app，至少是...对我有用的app，所以才有了这个项目。

希望自己可以一直有恒心完善下去：

**已完成**
- [x] 首页文章列表
- [x] banner
- [x] 微信公众号列表
- [x] 热门项目
- [x] 搜索
- [x] 我的收藏（网站，文章）
- [x] 添加&删除&编辑收藏
- [x] 体系
- [x] 导航
- [x] 积分（收益详情&排名列表）
- [x] 分享
- [x] 主题换肤

**未完成**

- [ ]  todo模块，希望可以完成一个todo提示，
- [ ] 吃枣药丸，加入一些比较好玩的东西，看博客腻了可以看点好玩的
- [ ] 放松放松，同上
- [ ] 实用工具，（至少我要加入一个千卡转千焦，千焦转大卡的计算工具）
- [ ] webViewPlugs和flutter自带webView的切换（实际上试过，plugs是整个覆盖在flutter页面上，实际上体验一般，很多控件不能自己定义；自带的webview性能一般）
- [ ] 切换字体
- [ ]  and so on 


## 基本架子
Flutter开发的一个爽点是：无脑堆代码（大雾），而最大的痛点也是这个，很多时候你会发现自己哼哧哼哧一通代码写下来：
```dart
class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        title: null,
        actions: <Widget>[],
      ),
      body: Column(children: <Widget>[],),
      bottomNavigationBar: Row(children: <Widget>[],),
    );
  }
}
```
**哇！！**  **一气呵成！** **浑身通透！**
再仔细一看：
```dart
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
```
![卧槽！！！！！！！！！！！！](https://upload-images.jianshu.io/upload_images/1924616-ac1bfd4562c24736.jpeg?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

 而且这只是v的代码，更别说还有mc的代码，一个稍微复杂点的页面，轻而易举就上了几百行代码，更别说没有提供页面预览功能（新版as已经提供了），这给日后的界面修改和业务修改都增加了难度，这其实就是很多人被劝退的直接原因了。
有没有解决办法呢？ 其实是有的，页面拆分就是一个不错的办法，把一个页面进行业务级的拆分，多个cell组成一个页面，单个cell可以独立，其实就是组件化的思想，但是！还是麻烦！！！
而且我也不满足于原生的方法，因为群里大佬已经在疯狂安利FishRedux了，而我想着说，反正是个2019的句号，索性我也画得疯狂一点，就用fisnRedex了。

###提前总结

**代码量爆炸！ 但是爽！！！！ 爽得可以边写代码边喝酒边唱歌！**
**有坑！！！！ 坑巨多！！ 文档贼少！！！**
**大部份坑都是可以解决的，而且很爽**

如果不是很了解*fishRedux*的可以去看下
[fishRedux地址](https://github.com/alibaba/fish-redux)
[用FishRedux完成一个登录页面](https://www.jianshu.com/p/a624b3029080)
### 页面预览
![Screenshot_2020-01-07-23-39-11-008_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-649568385c517d6b.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Screenshot_2020-01-07-23-39-18-750_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-ade0e081faedbc68.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Screenshot_2020-01-07-23-39-21-059_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-08cbc671155b4066.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Screenshot_2020-01-07-23-39-23-285_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-8ca3fca3d1fd7c1e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Screenshot_2020-01-07-23-39-30-113_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-9e3184958155104a.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![Screenshot_2020-01-07-23-39-36-264_com.lht.flutter_android_fun.png](https://upload-images.jianshu.io/upload_images/1924616-83d23a89bf6c0689.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

### 路由定义：
```dart
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
          /// 闪屏页
          'splash': SplashPage(),

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

          ///项目目录
          'project_list': ProjectListPage(),

          /// 项目子目录
          'project_child_list': ProjectChildPage(),

          /// webView页面
          'webView': WebLoadPage(),

          /// 微信公众号列表页面
          'wechat_author': AuthorPage(),

          /// 微信公众号文章列表页面
          'wechat_author_article': AuthorArticlePage(),

          /// 用户积分
          'user_point': UserPointPage(),

          /// 用户排名
          'user_rank': UserRankPage(),

          /// 网址收藏
          'web_collection': WebCollectionPage(),

          ///文章收藏
          'article_collection': ArticleCollectionPage(),

          /// 体系列表
          'system': SystemPage(),

          /// 体系列表下属文章
          'system_child': SystemChildPage(),

          /// 导航体系
          'navi': NaviPage(),

          /// 侧滑页面
          'draw': DrawPage(),

          /// 主题颜色修改
          'theme_change': ThemeChangePage(),

          /// 搜索页面
          'search': SearchPage(),
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
                newState.userPoint = appState.userPoint;
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
      indicatorColor: ColorConf.ColorFFFFFF,
      primarySwatch: ColorConf.themeColor,
    ),
    home: routes.buildPage('splash', null),
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

```
## 首页
根据FishRedux的思想，我们把首页架构定义为：
一个大的page（MainPage），里面用pageView装载了两个大的page（SecondPage&IndexPage），

### view
```dart
Widget buildView(MainState state, Dispatch dispatch, ViewService viewService) {
  /// 渲染appBar
  AppBar _renderAppBar() {
    return AppBar(
      backgroundColor: state.themeColor,
      centerTitle: true,
      titleSpacing: 60,
      title: TabBar(
        tabs: state.menuList
            .map((e) => Tab(
                  text: e,
                ))
            .toList(),
        labelColor: Colors.white,
        controller: state.tabControllerForMenu,
        labelPadding: const EdgeInsets.all(0),
        labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        unselectedLabelStyle: TextStyle(fontSize: 14),
        indicatorPadding: const EdgeInsets.all(0),
        indicatorSize: TabBarIndicatorSize.label,
      ),
      leading: Builder(builder: (ctx) {
        return IconButton(
          onPressed: () {
            dispatch(MainActionCreator.onOpenDraw(ctx));
          },
          icon: Image.asset(
            'images/icon_more.png',
            color: Colors.white,
            height: 24,
          ),
        );
      }),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            dispatch(MainActionCreator.onToSearch());
          },
          icon: Icon(Icons.search),
        )
      ],
    );
  }

  return Scaffold(
    primary: true,
    appBar: _renderAppBar(),
    body: TabBarView(
      controller: state.tabControllerForMenu,
      children: <Widget>[
        KeepAliveWidget(AppRoute.global.buildPage('second', null)),
        KeepAliveWidget(AppRoute.global.buildPage('index', null)),
      ],
    ),
    drawer: AppRoute.global.buildPage('draw', null),
  );
}
```

###  and so on
好像也没有其他什么需要注意的了，只有一个难点是**TabController**,以及page页面需要如何**保活**：
####  定义自己的TabController
这个可以参考下之前的文章：[在fishRedux中使用TabController](https://github.com/LinHuanTanLy/FishReduxFunAndroid/blob/dev_new_ui/lib/page/main/main_page.dart)

#### 页面保活
在普通的stf页面中，我们需要页面保持，只需要实现**AutomaticKeepAliveClientMixin **：
```dart
class _TestPageState extends State<testPage> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    /// 实现super方法
    super.build(context);
    return Container();
  }

  /// 返回true
  @override
  bool get wantKeepAlive => true;
}
```
而在*fishRedux*中就比较麻烦，我们需要把这个page用keepWidget包裹起来：
```dart
import 'package:flutter/material.dart';
/// 保持状态的包裹类
class KeepAliveWidget extends StatefulWidget {
  final Widget child;

  const KeepAliveWidget(this.child);

  @override
  State<StatefulWidget> createState() => _KeepAliveState();
}

class _KeepAliveState extends State<KeepAliveWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }
}

Widget keepAliveWrapper(Widget child) => KeepAliveWidget(child)
```
###  Adapter写法
我们看下首页的布局，很明显由几个cell组成：
* banner
* 公众号分类gridView
* 置顶推荐
* 项目推荐
* 首页分章分页

 如果在Android里面，那很明显就是一个RecyclerView+itemType组成；
 如果是在Flutter原生里面，那很明显就是一个ListView+ItemBuilder里面按item划分
 而我们在FishRedux里面，我们把页面做了一个拆分，页面是由一个SingleScrollView组成，而无论bannerComponent，classifyComponent，projectComponent，都是它的一个cell，而重头戏是articleComponent,它带有了父组件带来的loadMore和Refresh(其实整个页面都可以由一个ListView组成，当时不是很熟就用了上面的方法)，我们来看看布局层级：
![code](https://upload-images.jianshu.io/upload_images/1924616-039bacc9ee6952c0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

其中的Index_view为：
```dart
child: CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: viewService.buildComponent('banner'),
        ),
        SliverToBoxAdapter(
          child: viewService.buildComponent('classify'),
        ),
        SliverToBoxAdapter(
          child: viewService.buildComponent('hotArticle'),
        ),
      ],
    ),
```

#### adapter 
首页我们需要关注的是首页文章的*Adapter*,它隶属于**DynamicFlowAdapter**，其他的还有
*  [StaticFlowAdapter ](https://github.com/alibaba/fish-redux/blob/master/doc/concept/static-flow-adapter-cn.md)
* [CustomAdapter](https://github.com/alibaba/fish-redux/blob/master/doc/concept/custom-adapter-cn.md)
* [DynamicFlowAdapter](https://github.com/alibaba/fish-redux/blob/master/doc/concept/dynamic-flow-adapter-cn.md)
我们看下首页的代码：
```dart
class ArticleAdapter extends DynamicFlowAdapter<HotArticleState> {
  ArticleAdapter()
      : super(
          pool: <String, Component<Object>>{
            "article_cell": ArticleCellComponent(),
            "comm_article_cell": CommArticleCellComponent(),
            "hot_project_cell": ProjectComponent(),
          },
          connector: _ArticleAdapterConnector(),
          reducer: buildReducer(),
        );
}

class _ArticleAdapterConnector extends ConnOp<HotArticleState, List<ItemBean>> {
  @override
  List<ItemBean> get(HotArticleState state) {
    List<ItemBean> _tempList = [];
    _tempList.addAll(state.hotArticleDataSource
        .map((e) => ItemBean(
            "article_cell", ArticleCellState()..hotArticleCellBean = e))
        .toList());
    _tempList.add(ItemBean(
        "hot_project_cell",
        ProjectState()
          ..projectListDataSource = state.projectDataSource
          ..screenW = state.size?.width
          ..screenH = state.size?.height));
    _tempList.addAll(state.commArticleDataSource
        .map((e) =>
            ItemBean("comm_article_cell", CommArticleCellState()..cellBean = e))
        .toList());
    return _tempList;
  }

  @override
  void set(HotArticleState state, List<ItemBean> items) {}

  @override
  subReducer(reducer) {
    return super.subReducer(reducer);
  }
}
```
我们稍微分析下：
1. 我们在*pool*中定义了component的路由
2. 我们在_ArticleAdapterConnector的**get**方法中返回了一个ItemBean的List,其type为我们提前定义好的component，而data为各个component的state（各个component的state应该为page的子集）
3. over

## 个人页面&登录页面
本来还想写写其他页面的代码的，但是其实都是个人主页页面的代码的拓展，说难点其实没有，唯一的尴尬点就是代码量爆炸，还有一点是一开始用fishRedux会忘记使用方法，比如：
1. action怎么写？
2. 在effect还是reducer里面写逻辑？？
3. 我的分页要怎么写比较好？
4. 卧槽，我的tabController咋写
5. ...
这里把我的葵花宝典奉上，我把下面这段文字写成了一个txt，放在桌面，忘记了就打开看看:
```dart
action
用来定义在这个页面中发生的动作，例如：登录，清理输入框，更换验证码框等。
同时可以通过payload参数传值，传递一些不能通过state传递的值。

effect
这个dart文件在fish_redux中是定义来处理副作用操作的，比如显示弹窗，网络请求，数据库查询等操作。

page
这个dart文件在用来在路由注册，同时完成注册effect，reducer，component，adapter的功能。

reducer
这个dart文件是用来更新View，即直接操作View状态。

state
state用来定义页面中的数据，用来保存页面状态和数据。

view
view很明显，就是flutter里面当中展示给用户看到的页面。
```

## 结语
这个app还很粗糙，欢迎提issue，我会持续改进的。
![密码是123456](https://upload-images.jianshu.io/upload_images/1924616-08531bf20767f5fe.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
