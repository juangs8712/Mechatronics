import 'package:flutter/material.dart';

// --------------------------------------------------------------------------
class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        padding: const EdgeInsets.only(),
        margin: const EdgeInsets.only(),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: const Image(
                image: AssetImage('assets/ai-700x324.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
                left: 80,
                bottom: 5,
                child: Text(
                  'Mecatrónica',
                  style: TextStyle(
                      fontSize: 25, color: Colors.black.withOpacity(0.55)),
                ))
          ],
        ));
  }
}
// --------------------------------------------------------------------------

class HeaderCustomPaint extends StatelessWidget {
  const HeaderCustomPaint(
      {Key? key,
      required this.color,
      required this.title,
      required this.onPressed})
      : super(key: key);

  final String title;
  final Color color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _CustomPaintWidget(painter: _HeaderWavePainter1(color: color)),
        _CustomPaintWidget(painter: _HeaderWavePainter2(color: color)),
        _CustomPaintWidget(painter: _HeaderWavePainter3(color: color)),
        Positioned(
            child: Text(title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            top: 33,
            left: 50),
        Positioned(
            top: 20,
            child: IconButton(
                onPressed: () => onPressed(),
                icon: const Icon(
                  Icons.chevron_left,
                  size: 35,
                  color: Colors.blueGrey,
                )))
      ],
    );
  }
}

// --------------------------------------------------------------------------
class _CustomPaintWidget extends StatelessWidget {
  const _CustomPaintWidget({Key? key, required this.painter}) : super(key: key);

  final CustomPainter painter;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: CustomPaint(
        painter: painter,
      ),
    );
  }
}

// --------------------------------------------------------------------------
class _HeaderWavePainter1 extends CustomPainter {
  final Color? color;

  _HeaderWavePainter1({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = _initPen();
    paint.color = color ?? paint.color;
    final path = new Path();

    // dibujar con el path y el lapiz
    path.lineTo(0, 70);
    path.lineTo(size.width * 0.85, 70);
    path.quadraticBezierTo(size.width, 70, size.width, 100);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// --------------------------------------------------------------------------
class _HeaderWavePainter2 extends CustomPainter {
  final Color? color;

  _HeaderWavePainter2({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = _initPen();
    paint.color = color ?? paint.color;
    final path = Path();

    path.quadraticBezierTo(size.width * 0.1, 70, size.width * 0.5, 40);
    path.quadraticBezierTo(size.width, 10, size.width, 100);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// --------------------------------------------------------------------------
class _HeaderWavePainter3 extends CustomPainter {
  final Color? color;

  _HeaderWavePainter3({this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = _initPen();
    paint.color = color ?? paint.color;
    final path = Path();

    path.lineTo(0, 70);
    path.quadraticBezierTo(size.width * 0.05, 10, size.width * 0.3, 30);
    path.quadraticBezierTo(size.width * 0.4, 40, size.width * 0.7, 20);
    path.quadraticBezierTo(size.width, 10, size.width, 80);
    path.lineTo(size.width, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// --------------------------------------------------------------------------

Paint _initPen() {
  // este paint es como si fuera un lapiz
  final paint = Paint();

  // propiedades del paint o lapiz
  paint.color = const Color(0xff615AAB);
  paint.style = PaintingStyle.fill; // .fill o .stroke
  paint.strokeWidth = 5.0;

  return paint;
}
// --------------------------------------------------------------------------

