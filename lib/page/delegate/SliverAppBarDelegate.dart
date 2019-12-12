import 'package:flutter/material.dart';

/// SliverAppBar代理
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final Stack _tabBar;

  SliverAppBarDelegate(this._tabBar);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return _tabBar;
  }

  @override
  double get maxExtent => 41;

  @override
  double get minExtent => 41;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
