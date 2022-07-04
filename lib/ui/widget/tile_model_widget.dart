import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../model/tile_model.dart';
import '../theme/theme.dart';

// --------------------------------------------------------------------------
// genera el widget que contiene todo lo relacionado a un enlace
class TileModelWidget extends StatelessWidget {
  const TileModelWidget(
      {Key? key,
      required this.tileModel,
      required this.onPressed,
      required this.iconData})
      : super(key: key);

  final TileModel tileModel;
  final IconData iconData;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {

    final appTheme = Provider.of<ThemeChanger>(context);
    final themeColor = appTheme.currentTheme.colorScheme.secondary;

    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 70,
      decoration: appTheme.isLightTheme
        ? _buildDecorationLight()
        : _buildDecoration(),

      // child a mostrar en el container
      child: Stack(
        children: <Widget>[
          Positioned(
              child:
                  Icon(iconData, size: 110, color: themeColor.withOpacity(0.1)),
              right: 10,
              top: -10),
          GestureDetector(
            child: _MakeListTile(iconData: iconData, tileModel: tileModel),
            onTap: () => onPressed(),
          ),
        ],
      ),
    );
  }
}

// --------------------------------------------------------------------------
class _MakeListTile extends StatelessWidget {
  const _MakeListTile({
    Key? key,
    required this.iconData,
    required this.tileModel,
  }) : super(key: key);

  final IconData iconData;
  final TileModel tileModel;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return ListTile(
      leading: Icon(iconData, size: 40, color: appTheme.colorScheme.secondary),
      title: Text(
        tileModel.title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        tileModel.subtitle,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      trailing: tileModel.showTrailing
          ? const Icon(Icons.chevron_right, size: 35)
          : null,
    );
  }
}

// --------------------------------------------------------------------------
// retorna el BoxDecoration del container
BoxDecoration _buildDecorationLight() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    boxShadow: [
      BoxShadow(
          color: Colors.grey.withOpacity(0.1),
          offset: const Offset(7, 2),
          blurRadius: 2)
    ],
    gradient: LinearGradient(colors: <Color>[
      const Color(0xff869FB7).withOpacity(0.2),
      const Color(0xff73C9E0).withOpacity(0.3),
    ], stops: const <double>[
      0.05,
      0.35
    ], 
    begin: Alignment.topCenter, 
    end: Alignment.bottomRight),
  );
}
// --------------------------------------------------------------------------
BoxDecoration _buildDecoration() {
  return BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.circular(25),
    border: Border.all(color: Colors.white.withOpacity(0.1), width: 1),
    gradient: LinearGradient(colors: <Color>[
      const Color(0xff869FB7).withOpacity(0.2),
      const Color(0xff73C9E0).withOpacity(0.3),
    ], stops: const <double>[
      0.05,
      0.35
    ], 
    begin: Alignment.topCenter, 
    end: Alignment.bottomRight),
  );
}
// --------------------------------------------------------------------------