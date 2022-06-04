import 'package:demo_test/bloc/home_bloc.dart';
import 'package:demo_test/model/client.dart';
import 'package:demo_test/model/clinic.dart';
import 'package:demo_test/module/home/widgets/clinic_item.dart';
import 'package:flutter/material.dart';

class RecentlyVisitedClinicsWidget extends StatelessWidget {
  final HomeBloC homeBloC;
  const RecentlyVisitedClinicsWidget(this.homeBloC, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Client>(
        stream: homeBloC.userInformationStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const SliverToBoxAdapter(child: SizedBox.shrink());
          }
          Client client = snapshot.data!;
          return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            delegate: SliverChildBuilderDelegate((_, index) {
              return FutureBuilder<Clinic>(
                future:
                    homeBloC.getClinicInformation(client.visited?[index] ?? ''),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const SizedBox.shrink();
                  }
                  return ClinicItem(snapshot.data!);
                },
              );
            }, childCount: client.visited?.length ?? 0),
          );
        });
  }
}
