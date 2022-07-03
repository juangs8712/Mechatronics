import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme/theme.dart';

class CardButton extends StatelessWidget {
  const CardButton(
      {Key? key,
      required this.iconData,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final IconData iconData;
  final String text;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 1),
            gradient: LinearGradient(colors: <Color>[
              const Color(0xff869FB7).withOpacity(0.2),
              const Color(0xff73C9E0).withOpacity(0.3),
            ], stops: const <double>[
              0.05,
              0.35
            ], begin: Alignment.topCenter, end: Alignment.bottomRight),
            borderRadius: _borderRadiusGeometry()),
        child: _ButtonContain(iconData: iconData, text: text),
      ),
      onTap: () => onPressed(),
    );
  }

  BorderRadius _borderRadiusGeometry() {
    return const BorderRadius.only(
      topLeft: Radius.circular(35),
      bottomRight: Radius.circular(35),
      // bottomLeft: Radius.circular(30),
      // topRight: Radius.circular(30),
    );
  }
}

class _ButtonContain extends StatelessWidget {
  const _ButtonContain({Key? key, required this.iconData, required this.text})
      : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      _BackgroundIcon(iconData: iconData),
      _LeadingIconText(iconData: iconData, text: text)
    ]);
  }
}

class _LeadingIconText extends StatelessWidget {
  const _LeadingIconText({
    Key? key,
    required this.iconData,
    required this.text,
  }) : super(key: key);

  final IconData iconData;
  final String text;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const SizedBox(width: 15),
        CircleAvatar(
            backgroundColor: Colors.white.withOpacity(0.6),
            minRadius: 25,
            child: Icon(iconData,
                color: appTheme.colorScheme.secondary, size: 40)),
        const SizedBox(width: 10),
        Expanded(
          child: Text(text,
              maxLines: 2,
              style: appTheme.textTheme.bodyText1!
                  .copyWith(overflow: TextOverflow.ellipsis)),
        ),
        const Icon(
          Icons.arrow_forward_ios_sharp,
          color: Colors.white,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}

class _BackgroundIcon extends StatelessWidget {
  const _BackgroundIcon({
    Key? key,
    required this.iconData,
  }) : super(key: key);

  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final appTheme = Provider.of<ThemeChanger>(context).currentTheme;

    return Positioned(
      child: Icon(
        iconData,
        size: 120,
        color: appTheme.colorScheme.primary.withOpacity(0.1),
      ),
      top: -10,
      right: 25,
    );
  }
}
