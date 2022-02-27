import 'dart:developer';
import 'package:data_prime/cubits/space_create_cubit.dart';
import 'package:data_prime/models/planet_model.dart';
import 'package:data_prime/resources/app_colors.dart';
import 'package:data_prime/services/locator.dart';
import 'package:data_prime/services/navigation_service.dart';
import 'package:data_prime/widgets/rolling_circle.dart';
import 'package:data_prime/widgets/rolling_circle_addPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:rive/rive.dart';

class AddPlanetPage extends StatelessWidget {
  const AddPlanetPage();

  static const String routeName = '/addPlanetPage';

  static Widget create() {
    return const AddPlanetPage();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SpaceCreateCubit, SpaceCreateState>(
      builder: (context, state) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: kToolbarHeight,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.purpleColor.withOpacity(0.5),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          context
                              .read<SpaceCreateCubit>()
                              .saveAllDataToList()
                              .then(
                                (value) =>
                                    locator<NavigationService>().goBack(),
                              );
                        },
                        child: Text(
                          'Готово',
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(color: AppColors.lightBlueColor),
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                width: 300,
                height: 300,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    const SizedBox(
                      height: 50,
                      width: 50,
                      child: RiveAnimation.asset(
                        'assets/animations/sun.riv',
                        fit: BoxFit.fill,
                      ),
                    ),
                    RollingCircleAdd(
                      planetModel: PlanetModel(
                        orbitalSpeed: state.orbitalSpeed,
                        planetSize: state.planetSize,
                        remoteness: state.remoteness,
                        planetColor: state.planetColor,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                                  child: Text(
                                    'Установите цвет планеты',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6!
                                        .copyWith(fontSize: 24),
                                  ),
                                ),
                                ColorPicker(
                                    pickerColor: state.planetColor,
                                    enableAlpha: true,
                                    hexInputBar: false,
                                    displayThumbColor: false,
                                    onColorChanged: (value) {
                                      context
                                          .read<SpaceCreateCubit>()
                                          .changeColor(colorPlanet: value);
                                      log(state.planetColor.toString());
                                    }),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text(
                                    'Выбрать',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
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
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                      backgroundColor: Colors.black.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: BlocBuilder<SpaceCreateCubit, SpaceCreateState>(
                        builder: (context, state) {
                          return SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Установите отдаленность планеты',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Slider(
                                  value: state.remoteness,
                                  min: 50,
                                  max: 400,
                                  onChanged: (value) {
                                    context
                                        .read<SpaceCreateCubit>()
                                        .changeRemoteness(
                                            remoteness: value.roundToDouble());
                                    log(state.remoteness.toString());
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
                    'Установите отдаленность',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
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
                          return SizedBox(
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
                height: MediaQuery.of(context).size.height * 0.02,
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
                          return SizedBox(
                            height: 250,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Установите скорость вращения планеты',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Slider(
                                  value: state.orbitalSpeed.toDouble(),
                                  min: 999,
                                  max: 4999,
                                  onChanged: (value) {
                                    context
                                        .read<SpaceCreateCubit>()
                                        .changeOrbitalSpeed(
                                          orbitalSpeed: value.toInt(),
                                        );
                                    log(state.orbitalSpeed.toString());
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
                    'Установите скорость вращения планеты',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              const SizedBox(
                height: kBottomNavigationBarHeight,
              ),
            ],
          ),
        );
      },
    );
  }
}
