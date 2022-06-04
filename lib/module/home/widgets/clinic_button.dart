import 'package:demo_test/model/clinic.dart';
import 'package:flutter/material.dart';

class ClinicButton extends StatelessWidget {
  final Clinic clinic;
  const ClinicButton(this.clinic, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.black,
      focusColor: Colors.black,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                offset: const Offset(1.0, 1.0),
                blurRadius: 6.0,
                spreadRadius: -2.0,
                color: Theme.of(context).colorScheme.shadow,
              )
            ]),
        alignment: Alignment.center,
        child: Text(
          '${clinic.name}',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
