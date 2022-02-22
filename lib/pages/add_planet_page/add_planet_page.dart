import 'dart:developer';
import 'package:data_prime/cubits/space_create_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class AddPlanetPage extends StatelessWidget {
  const AddPlanetPage();

  static const String routeName = '/addPlanetPage';

  static Widget create() {
    return AddPlanetPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceCreateCubit, SpaceCreateState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.palnetColor,
                ),
                width: 120,
                height: 120,
              ),
              TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                            title: Text('Pick color'),
                            content: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ColorPicker(
                                  pickerColor: state.palnetColor,
                                  onColorChanged: (value) => context
                                      .read<SpaceCreateCubit>()
                                      .changeColor(colorPlanet: value),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Select'),
                                ),
                              ],
                            ),
                          ));
                },
                child: Text(
                  'Выберите цвет',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
