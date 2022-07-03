import 'package:flutter/material.dart';
import 'package:mechatronics/model/root_folder_model.dart';
import 'package:provider/provider.dart';

import 'share_prefs/share_prefs.dart';
import 'router/router.dart';
import 'ui/layout/auth_layout.dart';
import 'ui/theme/theme.dart';

void main() async {
  final prefs = SharedPrefs();
  WidgetsFlutterBinding.ensureInitialized();
  await prefs.initPrefs();
  int appTheme = prefs.getInt('app_theme') ?? 1;

  Flurorouter.configureRoute();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => RootFolderModel()),
    ChangeNotifierProvider<ThemeChanger>(
        create: (BuildContext context) => ThemeChanger(appTheme)),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeChanger>(context).currentTheme,
      title: 'Mechatronics',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      builder: (context, child) {
        return Overlay(
          initialEntries: [
            OverlayEntry(
                builder: (context) => AuthLayout(
                      child: child!,
                    ))
          ],
        );
      },
    );
  }
}
