import 'package:data_prime/models/planet_model.dart';
import 'package:flutter/material.dart';

class RollingCircleAdd extends StatefulWidget {
  final PlanetModel planetModel;

  const RollingCircleAdd({
    required this.planetModel,
  });

  @override
  _RollingCircleState createState() => _RollingCircleState();
}

class _RollingCircleState extends State<RollingCircleAdd>
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: widget.planetModel.orbitalSpeed),
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
              height: widget.planetModel.remoteness,
              width: widget.planetModel.remoteness,
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
                height: widget.planetModel.planetSize,
                width: widget.planetModel.planetSize,
                decoration:BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.planetModel.planetColor,
                ),
              ),
            ),

          ],
        ));
  }
}
