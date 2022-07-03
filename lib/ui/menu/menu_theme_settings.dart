import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

// --------------------------------------------------------------------------
class MenuSettingsTheme extends StatelessWidget {
  const MenuSettingsTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context);
    final textStyle = appTheme.currentTheme.textTheme.bodyText1;

    return Column(
      children: <Widget>[
        // Widget de encabezado
        Row(children: <Widget>[
          const SizedBox(width: 20),
          Text('Temas', style: textStyle)
        ]),

        // Switch del tema oscuro
        ListTile(
          leading: Icon(
            Icons.dark_mode_sharp,
            color: appTheme.currentTheme.colorScheme.secondary,
          ),
          title: const Text('Oscuro'),
          // trailing: Switch(value: true, onChanged: (value) {}),
          trailing: Switch.adaptive(
              value: appTheme.darkTheme,
              activeColor: appTheme.currentTheme.colorScheme.secondary,
              onChanged: (value) => appTheme.darkTheme = value),
        ),

        // Switch del tema personalizado
        ListTile(
          leading: Icon(
            Icons.dark_mode_outlined,
            color: appTheme.currentTheme.colorScheme.secondary,
          ),
          title: const Text('Personalizado'),
          // trailing: Switch(value: true, onChanged: (value) {}),
          trailing: Switch.adaptive(
              value: appTheme.customTheme,
              activeColor: appTheme.currentTheme.colorScheme.secondary,
              onChanged: (value) => appTheme.customTheme = value),
        )
      ],
    );
  }
}

// --------------------------------------------------------------------------
