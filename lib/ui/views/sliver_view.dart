import 'package:flutter/material.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _MainScroll();
  }
}

class _MainScroll extends StatelessWidget {
  _MainScroll({Key? key}) : super(key: key);

  final items = [
    // const _ListItem(text: 'Orange', color: Color(0xffF08F66)),
    // const _ListItem(text: 'Family', color: Color(0xffF2A38A)),
    // const _ListItem(text: 'Subscription', color: Color(0xffF7CDD5)),
    // const _ListItem(text: 'Book', color: Color(0xffFCDBAF)),
    // const _ListItem(text: 'Orange', color: Color(0xffF08F66)),
    // const _ListItem(text: 'Family', color: Color(0xffF2A38A)),
    // const _ListItem(text: 'Subscription', color: Color(0xffF7CDD5)),
    // const _ListItem(text: 'Book', color: Color(0xffFCDBAF)),
    // const _ListItem(text: 'Orange', color: Color(0xffF08F66)),
    // const _ListItem(text: 'Family', color: Color(0xffF2A38A)),
    // const _ListItem(text: 'Subscription', color: Color(0xffF7CDD5)),
    // const _ListItem(text: 'Book', color: Color(0xffFCDBAF)),
  ];

  @override
  Widget build(BuildContext context) {
    // final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: <Widget>[
        SliverPersistentHeader(
            floating: true,
            delegate: _SliverCustomHeaderDelegate(
                minHeight: 150.0,
                maxHeight: 180.0,
                child: Container(
                  alignment: Alignment.centerLeft,
                  // color: appTheme.scaffoldBackgroundColor,
                  child: _Titulo(),
                ))),
        SliverList(
            delegate: SliverChildListDelegate(
                [...items, const SizedBox(height: 100.0)]))
      ],
    );
  }
}

class _SliverCustomHeaderDelegate extends SliverPersistentHeaderDelegate {
  _SliverCustomHeaderDelegate(
      {required this.minHeight, required this.maxHeight, required this.child});

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant _SliverCustomHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class _Titulo extends StatelessWidget {
  const _Titulo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
