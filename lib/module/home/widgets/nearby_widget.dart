import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/model/clinic.dart';
import 'package:demo_test/module/home/widgets/clinic_item.dart';
import 'package:flutter/material.dart';

class NearbyClinics extends StatelessWidget {
  final HomeBloC homeBloC;
  const NearbyClinics(this.homeBloC, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Clinic>>(
        stream: homeBloC.clinicsStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          List<Clinic> clinics = snapshot.data!;
          return SliverList(
              delegate: SliverChildBuilderDelegate(
                  (_, index) => SizedBox(
                      height: 100,
                      child: ClinicItem(
                        clinics[index],
                        isNearby: true,
                      )),
                  childCount: clinics.length));
        });
  }
}
