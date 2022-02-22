import 'package:data_prime/pages/add_planet_page/add_planet_page.dart';
import 'package:data_prime/resources/app_colors.dart';
import 'package:data_prime/services/locator.dart';
import 'package:data_prime/services/navigation_service.dart';
import 'package:data_prime/widgets/rolling_circle.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class HomePage extends StatelessWidget {
  const HomePage();

  static const String routeName = '/homePage';

  static Widget create() {
    return HomePage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/bg.png'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: kToolbarHeight),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text(
              'Data Time \nSpace System',
              style:
                  Theme.of(context).textTheme.headline6!.copyWith(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 50,
                width: 50,
                child: RiveAnimation.asset(
                  'assets/animations/sun.riv',
                  fit: BoxFit.fill,
                ),
              ),
              RollingCircle(
                planetHeight: 10,
                remoteness: 100,
              ),
              RollingCircle(
                remoteness: 200,
                planetHeight: 20,
                orbitalSpeed: 1100,
              ),
              RollingCircle(
                planetHeight: 30,
                remoteness: 150,
                orbitalSpeed: 1100,
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: kBottomNavigationBarHeight),
            child: GestureDetector(
              onTap:() =>
                  locator<NavigationService>().navigateTo(AddPlanetPage.routeName),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                height: MediaQuery.of(context).size.height * 0.09,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: AppColors.purpleColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Добавить планету в систему',
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
