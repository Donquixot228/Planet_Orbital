part of 'space_create_cubit.dart';

class SpaceCreateState {
  final double planetSize;
  final Color palnetColor;

  const SpaceCreateState({
    required this.planetSize,
    required this.palnetColor,
  });

  factory SpaceCreateState.initial() {
    return SpaceCreateState(
      planetSize: 20,
      palnetColor: AppColors.brownColor,
    );
  }

  SpaceCreateState copyWith({
    double? planetSize,
    Color? palnetColor,
  }) {
    return SpaceCreateState(
      palnetColor: palnetColor ?? this.palnetColor,
      planetSize: planetSize ?? this.planetSize,
    );
  }
}
