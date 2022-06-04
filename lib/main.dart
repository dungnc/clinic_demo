import 'package:demo_test/bloc/app_bloc.dart';
import 'package:demo_test/firebase_options.dart';
import 'package:demo_test/module/home/home.dart';
import 'package:demo_test/module/home/home_screen.dart';
import 'package:demo_test/util/app_theme.dart';
import 'package:demo_test/util/theme_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<AppBloC>(
      create: (context) => AppBloC(),
      dispose: (context, bloc) => bloc.dispose(),
      builder: (context, _) {
        return StreamBuilder<bool>(
            stream: context.read<AppBloC>().isDarkStream,
            initialData: false,
            builder: (context, snapshot) {
              ThemeMode themeMode = ThemeMode.light;
              if (snapshot.data ?? false) {
                themeMode = ThemeMode.dark;
              }
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: AppTheme().lightTheme,
                darkTheme: AppTheme().darkTheme,
                themeMode: themeMode,
                home: const MyHomePage(),
              );
            });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter App'),
        actions: const [ThemeButton()],
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const HomeModule()));
          },
          child: Text(
            'Login',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
      ),
    );
  }
}
