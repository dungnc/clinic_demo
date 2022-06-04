import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/module/home/widgets/featured_widget.dart';
import 'package:demo_test/module/home/widgets/nearby_widget.dart';
import 'package:demo_test/module/home/widgets/recently_visited_widget.dart';
import 'package:demo_test/module/home/widgets/title_widget.dart';
import 'package:demo_test/util/theme_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloC homeBloC;

  @override
  void initState() {
    homeBloC = context.read<HomeBloC>();

    homeBloC.getClinics();
    homeBloC.getUserInfor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: const [ThemeButton()],
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification) =>
            _onScrollNotification(context, notification),
        child: CustomScrollView(
          slivers: <Widget>[
            const TitleWidget('Featured'),
            FeaturedClinicsWidget(homeBloC),
            const TitleWidget('Recently visted'),
            RecentlyVisitedClinicsWidget(homeBloC),
            const TitleWidget('Nearby'),
            NearbyClinics(homeBloC),
          ],
        ),
      ),
    );
  }

  bool _onScrollNotification(
      BuildContext context, ScrollNotification? notification) {
    if (notification is ScrollEndNotification) {
      //Loadmore whenever user scroll to the end of list
      final before = notification.metrics.extentBefore;
      final max = notification.metrics.maxScrollExtent;

      if (before == max && notification.metrics.axis == Axis.vertical) {
        homeBloC.getClinics(loadmore: true);
      }
    }
    return false;
  }
}
