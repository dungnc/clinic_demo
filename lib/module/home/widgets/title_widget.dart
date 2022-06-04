import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String name;
  const TitleWidget(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 4, top: 4),
        child: Text(name, style: Theme.of(context).textTheme.headlineSmall),
      ),
    );
  }
}
