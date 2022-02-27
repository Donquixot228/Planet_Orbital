part of 'space_create_cubit.dart';

class SpaceCreateState {
  final double planetSize;
  final Color planetColor;
  final double remoteness;
  final int orbitalSpeed;
  final List<PlanetModel> listPlanet;
  final List<RollingCircle> listRollingWidget;

  SpaceCreateState({
    required this.orbitalSpeed,
    required this.planetSize,
    required this.planetColor,
    required this.remoteness,
    required this.listPlanet,
    required this.listRollingWidget,
  });

  factory SpaceCreateState.initial() {
    return SpaceCreateState(
      listPlanet: [],
      orbitalSpeed: 1100,
      remoteness: 100,
      planetSize: 15,
      planetColor: AppColors.brownColor,
      listRollingWidget: [],
    );
  }

  SpaceCreateState copyWith({
    double? planetSize,
    Color? planetColor,
    double? remoteness,
    int? orbitalSpeed,
  }) {
    return SpaceCreateState(
      listPlanet: this.listPlanet,
      listRollingWidget: this.listRollingWidget,
      orbitalSpeed: orbitalSpeed ?? this.orbitalSpeed,
      remoteness: remoteness ?? this.remoteness,
      planetColor: planetColor ?? this.planetColor,
      planetSize: planetSize ?? this.planetSize,
    );
  }
}
