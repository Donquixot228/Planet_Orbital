import 'package:bloc/bloc.dart';
import 'package:data_prime/models/planet_model.dart';
import 'package:data_prime/resources/app_colors.dart';
import 'package:data_prime/widgets/rolling_circle.dart';
import 'package:flutter/material.dart';

part 'space_create_state.dart';

class SpaceCreateCubit extends Cubit<SpaceCreateState> {
  SpaceCreateCubit() : super(SpaceCreateState.initial());

//Изменение цвета планеты --[START]
  Future<void> changeColor({required Color colorPlanet}) async {
    emit(state.copyWith(planetColor: colorPlanet));
  }

//Изменение размера планеты --[START]
  Future<void> changeSizePlaner({required double planetSize}) async {
    emit(state.copyWith(planetSize: planetSize));
  }

//Изменение отдаленности планеты --[START]
  Future<void> changeRemoteness({required double remoteness}) async {
    emit(state.copyWith(remoteness: remoteness));
  }

  //Изменение скорости вращения  планеты --[START]
  Future<void> changeOrbitalSpeed({required int orbitalSpeed}) async {
    emit(state.copyWith(orbitalSpeed: orbitalSpeed));
  }

  Future<void> saveAllDataToList() async {
    state.listRollingWidget.add(
      RollingCircle(
        planetModel: PlanetModel(
          orbitalSpeed: state.orbitalSpeed,
          planetSize: state.planetSize,
          planetColor: state.planetColor,
          remoteness: state.remoteness,
        ),
      ),
    );
  }
}
