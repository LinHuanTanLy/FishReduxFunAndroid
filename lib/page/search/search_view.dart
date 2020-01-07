import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_android_fun/conf/ColorConf.dart';
import 'package:flutter_android_fun/domain/entity/HotSearchBean.dart';
import 'package:flutter_android_fun/widget/RefreshWidget.dart';

import 'search_action.dart';
import 'search_state.dart';

Widget buildView(
    SearchState state, Dispatch dispatch, ViewService viewService) {
  ListAdapter _listAdapter = viewService.buildAdapter();

  TextStyle _styleForTitle =
      TextStyle(fontSize: 12, color: ColorConf.Color8048586D);

  /// 渲染title
  Widget _renderTitle(String title) {
    return Container(
      child: Text(
        title,
        style: _styleForTitle,
      ),
      margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
    );
  }

  /// 渲染item
  Widget _renderHotKey(HotSearchCellBean bean) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: state.themeColor,
        ),
        child: Text(
          bean?.name,
          style: TextStyle(fontSize: 13, color: ColorConf.ColorFFFFFF),
        ),
      ),
      onTap: () {
        dispatch(SearchActionCreator.onClickTag(bean?.name));
      },
    );
  }

  /// 渲染搜索记录和热词
  Widget _renderWrap(List<HotSearchCellBean> list) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: Wrap(
        direction: Axis.horizontal,
        verticalDirection: VerticalDirection.down,
        crossAxisAlignment: WrapCrossAlignment.start,
        runAlignment: WrapAlignment.start,
        runSpacing: 10,
        spacing: 10,
        children: list.map((e) => _renderHotKey(e)).toList(),
      ),
      alignment: Alignment.centerLeft,
    );
  }

  /// 初始化appbar
  AppBar _initSearchAppBar() {
    OutlineInputBorder _border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide(color: ColorConf.ColorFFFFFF, width: 0.3));
    return AppBar(
      backgroundColor: state.themeColor,
      centerTitle: true,
      titleSpacing: 0,
      title: Container(
        child: TextField(
          textInputAction: TextInputAction.search,
          style: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
          textAlign: TextAlign.left,
          maxLines: 1,
          decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.only(left: 10.0, right: 10, top: 0, bottom: 0),
              focusedBorder: _border,
              border: _border,
              enabledBorder: _border,
              disabledBorder: _border,
              hintText: '文章/作者/关键字',
              alignLabelWithHint: true,
              hintStyle: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
              counterStyle:
                  TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
              labelStyle: TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
              suffixStyle:
                  TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
              prefixStyle:
                  TextStyle(fontSize: 14, color: ColorConf.ColorFFFFFF),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: ColorConf.ColorFFFFFF,
                ),
                onPressed: () {
                  dispatch(SearchActionCreator.onToClean());
                },
              )),
          controller: state.textEditingControllerForInput,
        ),
        height: 36,
      ),
      actions: <Widget>[
        GestureDetector(
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Text('搜索'),
            alignment: Alignment.center,
          ),
          onTap: () {
            dispatch(SearchActionCreator.onToSearch());
          },
        )
      ],
    );
  }

  /// 渲染页面数据
  Widget _renderBody() {
    if (state.pageIndex == 1 && state.searchResultList.isEmpty == true) {
//      搜索过了，但是没数据，显示空页面
      return Container(
        child: Text('暂无数据'),
      );
    } else if (state.pageIndex > 0 &&
        state.searchResultList.isNotEmpty == true) {
//      搜索过了，且有数据

      return RefreshWidget(state.themeColor, state.refreshController,
          state.pageIndex, _listAdapter, null, () {
        dispatch(SearchActionCreator.onLoadMore());
      });
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _renderTitle('大家都在搜'),
          _renderWrap(state.hotSearchBeanList),
          _renderTitle('您搜过'),
          _renderWrap(state.searchHistoryList),
        ],
      );
    }
  }

  return Scaffold(
    appBar: _initSearchAppBar(),
    body: _renderBody(),
  );
}
