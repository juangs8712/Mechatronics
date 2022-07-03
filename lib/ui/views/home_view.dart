import 'package:flutter/material.dart';

import '../menu/menu_options.dart';
import '../menu/menu_theme_settings.dart';
import '../widget/headers.dart';

// --------------------------------------------------------------------------
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Mecatrónica'),
        ),
        drawer: const _CustomDrawer(),
        // body: LinksPage()
        body: const DefaultMenuOptions(separated: true));
  }
}

// --------------------------------------------------------------------------
class _CustomDrawer extends StatelessWidget {
  const _CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const CustomDrawerHeader(),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: const <Widget>[
                    DefaultMenuOptions(),
                    ActivityMenuOptions(),
                    OthersMenuOptions(),
                    MenuSettingsTheme()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------


