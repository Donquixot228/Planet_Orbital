import 'dart:developer';
import 'package:data_prime/cubits/space_create_cubit.dart';
import 'package:data_prime/resources/app_colors.dart';
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
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: state.palnetColor,
                ),
                width: state.planetSize < 20 ? 30: state.planetSize,
                height: state.planetSize < 20 ? 30: state.planetSize,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                          backgroundColor: Colors.black.withOpacity(0.9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8),
                                  child: Text('Установите цвет планеты',style: Theme.of(context).textTheme.headline6!.copyWith(fontSize: 24),),
                                ),
                                ColorPicker(
                                    pickerColor: state.palnetColor,
                                    enableAlpha: true,
                                    hexInputBar: false,
                                    displayThumbColor: false,

                                    onColorChanged: (value) {
                                      context
                                          .read<SpaceCreateCubit>()
                                          .changeColor(colorPlanet: value);
                                      log(state.palnetColor.toString());
                                    }),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('Select'),
                                ),
                              ],
                            ),
                          ));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.07,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.purpleColor.withOpacity(0.5),
                  ),
                  child: Text(
                    'Выберите цвет',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      child: BlocBuilder<SpaceCreateCubit, SpaceCreateState>(
                        builder: (context, state) {
                          return Container(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Установите размер планеты',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Slider(
                                  value: state.planetSize,
                                  min: 1,
                                  max: 50,
                                  onChanged: (value) {
                                    context
                                        .read<SpaceCreateCubit>()
                                        .changeSizePlaner(
                                            planetSize: value.roundToDouble());
                                    log(state.planetSize.toString());
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.height * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: AppColors.purpleColor.withOpacity(0.5),
                  ),
                  child: Text(
                    'Установите размер планеты',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: kBottomNavigationBarHeight,
              ),
            ],
          ),
        );
      },
    );
  }
}
