import 'package:demo_test/bloc/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
        stream: context.read<AppBloC>().isDarkStream,
        initialData: false,
        builder: (context, snapshot) {
          bool isDark = snapshot.data ?? false;
          return TextButton(
              onPressed: () {
                context.read<AppBloC>().isDark = !isDark;
              },
              child: Text('${isDark ? 'Dark' : 'Light'} Theme'));
        });
  }
}
