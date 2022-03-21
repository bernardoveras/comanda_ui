import 'package:flutter/material.dart';

import 'component_appbar.dart';

class ComponentScaffold extends StatelessWidget {
  const ComponentScaffold(
    this.title, {
    Key? key,
    this.children = const <Widget>[],
    this.padding = const EdgeInsets.all(24),
    this.physics = const BouncingScrollPhysics(),
    this.crossAxisAlignment = CrossAxisAlignment.start,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final EdgeInsetsGeometry padding;
  final ScrollPhysics physics;
  final CrossAxisAlignment crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, _) => [
          ComponentAppBar(title: title),
        ],
        body: SingleChildScrollView(
          physics: physics,
          child: Padding(
            padding: padding,
            child: Column(
              crossAxisAlignment: crossAxisAlignment,
              children: children,
            ),
          ),
        ),
      ),
    );
  }
}
