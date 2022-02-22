import 'package:flutter/material.dart';

class RollingCircle extends StatefulWidget {
  final double remoteness;
  final int orbitalSpeed;
  final double planetHeight;

  const RollingCircle({
    required this.planetHeight,
    required this.remoteness,
    this.orbitalSpeed = 1100,
  });

  @override
  _RollingCircleState createState() => _RollingCircleState();
}

class _RollingCircleState extends State<RollingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.orbitalSpeed),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
        turns: _controller,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: widget.remoteness,
              width: widget.remoteness,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 1),
              ),
            ),
            Positioned(
              top: -5,
              left: 0,
              right: 0,
              child: Container(
                height: widget.planetHeight,
                width: widget.planetHeight,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFF65000),
                ),
              ),
            ),
          ],
        ));
  }
}
