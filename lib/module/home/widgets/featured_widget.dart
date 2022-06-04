import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/model/clinic.dart';
import 'package:demo_test/module/home/widgets/clinic_button.dart';
import 'package:flutter/material.dart';

class FeaturedClinicsWidget extends StatelessWidget {
  final HomeBloC homeBloC;
  const FeaturedClinicsWidget(this.homeBloC, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _onScrollNotification(
        BuildContext context, ScrollNotification? notification) {
      if (notification is ScrollEndNotification) {
        //Loadmore whenever user scroll to the end of list
        final before = notification.metrics.extentBefore;
        final max = notification.metrics.maxScrollExtent;
        if (before == max) {
          homeBloC.getClinics(loadmore: true);
        }
      }
      return false;
    }

    return SliverToBoxAdapter(
      child: SizedBox(
        height: 60,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) =>
              _onScrollNotification(context, notification),
          child: StreamBuilder<List<Clinic>>(
              stream: homeBloC.clinicsStream,
              builder: (context, snapshot) {
                if (!snapshot.hasData) return const Text('Empty');
                List<Clinic> clinics = snapshot.data ?? [];
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: clinics.length,
                  itemBuilder: (context, index) {
                    return ClinicButton(clinics[index]);
                  },
                );
              }),
        ),
      ),
    );
  }
}
