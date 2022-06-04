import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/module/home/home_screen.dart';
import 'package:demo_test/service/imp/home_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeModule extends StatelessWidget {
  const HomeModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<HomeBloC>(
      create: (_) => HomeBloC(HomeService(FirebaseFirestore.instance)),
      dispose: (_, bloc) => bloc.dispose(),
      child: const HomeScreen(),
    );
  }
}
