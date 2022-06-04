import 'dart:math';

import 'package:demo_test/model/clinic.dart';
import 'package:flutter/material.dart';

class ClinicItem extends StatelessWidget {
  final Clinic clinic;
  final bool isNearby;
  const ClinicItem(this.clinic, {Key? key, this.isNearby = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 8),
              width: double.infinity,
              child: Text(
                '${clinic.name}',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontWeight: FontWeight.w500),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Address: ${clinic.address}',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (isNearby)
                  Padding(
                    padding: const EdgeInsets.only(top: 2),
                    child: Text(
                      'Distance: ${clinic.distance}km',
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
