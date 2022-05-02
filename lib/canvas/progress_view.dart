import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_view.dart';

class ProgressView extends StatefulWidget {
  const ProgressView({Key? key}) : super(key: key);
  @override
  State<ProgressView> createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView>
    with SingleTickerProviderStateMixin {
  late AnimationController cargaController;

  @override
  void initState() {
    cargaController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..addListener(
        () {
          setState(
            () {},
          );
        },
      );
    cargaController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    cargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: SizedBox(
          // color: Colors.amber,
          width: 150,
          height: 150,
          child: CustomPaint(
            painter: _ProgressCustom(cargaController.value * 100),
          ),
        ),
      ),
    );
  }
}

class _ProgressCustom extends CustomPainter {
  double carga = 0;
  _ProgressCustom(this.carga);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    final paint2 = Paint();

    double start = -math.pi / 2;

    double sweptAngle = (math.pi * 2 * carga) / 100;

    paint.color = ColorsView.bgEnabled;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 6;

    paint2.color = ColorsView.barused;
    paint2.style = PaintingStyle.stroke;
    paint2.strokeWidth = 8;

    canvas.drawCircle(
        Offset(size.width * 0.50, size.height * 0.50), size.height / 2, paint);

    canvas.drawArc(
        Rect.fromCircle(
            center: Offset(size.height * 0.50, size.height * 0.50),
            radius: size.height / 2),
        start,
        sweptAngle,
        false,
        paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
