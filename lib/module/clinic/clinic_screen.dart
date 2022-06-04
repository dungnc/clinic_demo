import 'package:demo_test/model/client.dart';
import 'package:flutter/material.dart';

class ClinicScreen extends StatefulWidget {
  final Client client;
  const ClinicScreen(
    this.client, {
    Key? key,
  }) : super(key: key);

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('${widget.client.name}'),
      ),
    );
  }
}
