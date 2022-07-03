import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../model/root_folder_model.dart';
import '../../share_prefs/share_prefs.dart';
import '../../utils/custom_path_provider.dart';
import '../../utils/menu_actions.dart';
import '../theme/theme.dart';

// --------------------------------------------------------------------------
class DefaultMenuOptions extends StatelessWidget {
  const DefaultMenuOptions({Key? key, this.separated = false})
      : super(key: key);

  final bool separated;

  @override
  Widget build(BuildContext context) {
    final filePickerModel =
        Provider.of<RootFolderModel>(context, listen: false);

    final pathName = filePickerModel.pathName;

    final List<Widget> _options = [
      // Libros
      _CustomListTile(
          iconData: Icons.auto_stories_sharp,
          text: 'Libros',
          onPressed: () async {
            if (await CustomPathProvider.existsDirectory(context, '/01_book',
                root: pathName)) {
              MenuAction.listFiles(context, 'Libros', pathName! + '/01_book');
            }
          }),

      // Revistas
      _CustomListTile(
          iconData: Icons.analytics_sharp,
          text: 'Revistas',
          onPressed: () async {
            if (await CustomPathProvider.existsDirectory(
                context, '/02_magazine',
                root: pathName)) {
              MenuAction.listFiles(
                  context, 'Revistas', pathName! + '/02_magazine');
            }
          }),

      // Avances en mecatronica
      _CustomListTile(
          iconData: Icons.electrical_services_rounded,
          text: 'Avances en Mecatrónica',
          onPressed: () async {
            if (await CustomPathProvider.existsDirectory(context, '/03_advance',
                root: pathName)) {
              MenuAction.listFiles(
                  context, 'Avances en Mecatrónica', pathName! + '/03_advance');
            }
          }),

      // Documentacion tecnica
      _CustomListTile(
          iconData: Icons.note,
          text: 'Documentación técnica',
          onPressed: () async {
            if (await CustomPathProvider.existsDirectory(
                context, '/04_documents',
                root: pathName)) {
              MenuAction.listFiles(context, 'Documentación técnica',
                  pathName! + '/04_documents');
            }
          }),

      // Glosario de términos
      _CustomListTile(
          iconData: Icons.category,
          text: 'Glosario de términos',
          onPressed: () {
            MenuAction.showTermsPage(context, pathName);
          }),
    ];
    if (separated) {
      return ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _options[index];
          },
          separatorBuilder: (context, index) {
            return const Divider();
          },
          itemCount: _options.length);
    } else {
      return Column(children: _options);
    }
  }
}

// --------------------------------------------------------------------------
class ActivityMenuOptions extends StatelessWidget {
  const ActivityMenuOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pathName =
        Provider.of<RootFolderModel>(context, listen: false).pathName;

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    final textStyle = appTheme.textTheme.bodyText1;

    return Column(
      children: <Widget>[
        // Widget de encabezado
        Row(children: <Widget>[
          const SizedBox(width: 20),
          Text('Actividades prácticas', style: textStyle)
        ]),

        // Laboratorio
        _CustomListTile(
            iconData: Icons.biotech_rounded,
            text: 'Nuestro laboratorio',
            onPressed: () async {
              if (await CustomPathProvider.existsDirectory(
                  context, '/05_laboratory',
                  root: pathName)) {
                MenuAction.listFiles(context, 'Nuestro laboratorio',
                    pathName! + '/05_laboratory');
              }
            }),

        // Tareas
        _CustomListTile(
            iconData: Icons.settings_accessibility_sharp,
            text: 'Hazlo tú mismo',
            onPressed: () async {
              if (await CustomPathProvider.existsDirectory(
                  context, '/04_documents',
                  root: pathName)) {
                MenuAction.listFiles(context, 'Hazlo tú mismo',
                    pathName! + '/06_make_it_yourself');
              }
            }),
      ],
    );
  }
}

// --------------------------------------------------------------------------
class OthersMenuOptions extends StatelessWidget {
  const OthersMenuOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final pathName =
        Provider.of<RootFolderModel>(context, listen: false).pathName;

    final filePickerModel =
        Provider.of<RootFolderModel>(context, listen: false);

    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    final textStyle = appTheme.textTheme.bodyText1!;

    return Column(
      children: <Widget>[
        // Encabezado de la seccion
        Row(children: <Widget>[
          const SizedBox(width: 20),
          Text('Más ...', style: textStyle),
        ]),

        // Enlaces externos
        _CustomListTile(
            iconData: Icons.link,
            text: 'Enlaces externos',
            onPressed: () {
              MenuAction.showLinksPage(context, pathName);
            }),

        // Seleccion del directorio
        _CustomListTile(
            iconData: Icons.folder_rounded,
            text: 'Seleccionar directorio',
            onPressed: () async {
              final SharedPrefs pref = SharedPrefs();
              final String? path = await filePickerModel.pickDirectory();

              if (path != null) {
                pref.setString('root', path);
              }
            }),
      ],
    );
  }
}

// --------------------------------------------------------------------------
class _CustomListTile extends StatelessWidget {
  const _CustomListTile({
    Key? key,
    required this.iconData,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final IconData iconData;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;
    return ListTile(
      leading: Icon(iconData, color: appTheme.colorScheme.secondary),
      title: Text(text),
      onTap: () => onPressed(),
    );
  }
}
// --------------------------------------------------------------------------