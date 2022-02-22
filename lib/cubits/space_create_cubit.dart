import 'package:bloc/bloc.dart';
import 'package:data_prime/resources/app_colors.dart';
import 'package:flutter/material.dart';

part 'space_create_state.dart';

class SpaceCreateCubit extends Cubit<SpaceCreateState> {
  SpaceCreateCubit() : super(SpaceCreateState.initial());

Future<void> changeColor({required Color colorPlanet})async{
  emit(state.copyWith(palnetColor: colorPlanet));
}

  Future<void> changeSizePlaner({required double planetSize})async{
    emit(state.copyWith(planetSize: planetSize));
  }



}
