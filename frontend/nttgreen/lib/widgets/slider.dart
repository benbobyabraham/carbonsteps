import 'package:flutter/material.dart';

class CustomSlider extends StatefulWidget {
  final double value;
  final ValueChanged<double> onChanged;
  final double min;
  final double max;
  final int divisions;
  final double thumbRadius;
  final bool showTickMarks;
  final double trackHeight;

  CustomSlider({
    required this.value,
    required this.onChanged,
    required this.min,
    required this.max,
    required this.divisions,
    this.thumbRadius = 14.0,
    this.showTickMarks = true,
    this.trackHeight = 20.0,
  });

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: widget.trackHeight,
        thumbShape: RoundSliderThumbShape(
          enabledThumbRadius: widget.thumbRadius,
          disabledThumbRadius: widget.thumbRadius,
        ),
        overlayShape:
            RoundSliderOverlayShape(overlayRadius: widget.thumbRadius),
      ),
      child: CustomPaint(
        painter: CustomSliderPainter(
          divisions: widget.divisions,
          trackHeight: widget.trackHeight,
        ),
        child: Slider(
          value: widget.value,
          onChanged: widget.onChanged,
          min: widget.min,
          max: widget.max,
          divisions: widget.showTickMarks ? widget.divisions : null,
          activeColor: Color.fromARGB(255, 4, 110, 73),
          inactiveColor: const Color.fromARGB(255, 185, 185, 185),
          thumbColor: Colors.white,
          label: widget.value.toStringAsFixed(1),
        ),
      ),
    );
  }
}

class CustomSliderPainter extends CustomPainter {
  final int divisions;
  final double trackHeight;

  CustomSliderPainter({
    required this.divisions,
    required this.trackHeight,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = Colors.white // Tick mark color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5.0; // Adjust the width of tick marks

    if (divisions > 0) {
      final double divisionWidth = size.width / divisions;

      for (int i = 0; i <= divisions; i++) {
        final double tickX = i * divisionWidth;
        final double tickY1 = (size.height - trackHeight) / 2;
        final double tickY2 = tickY1 + trackHeight;
        final Offset start = Offset(tickX, tickY1);
        final Offset end = Offset(tickX, tickY2);
        canvas.drawLine(start, end, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
