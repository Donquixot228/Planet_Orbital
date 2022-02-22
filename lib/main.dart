import 'package:data_prime/cubits/space_create_cubit.dart';
import 'package:data_prime/pages/pages.dart';
import 'package:data_prime/resources/app_theme.dart';
import 'package:data_prime/routes/app_router.dart';
import 'package:data_prime/services/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'services/navigation_service.dart';

void main() {
  setupLocator();
  runApp(BlocProvider(
    create: (context) => SpaceCreateCubit(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      home: Scaffold(
        extendBody: true,
        body: Navigator(
          key: locator<NavigationService>().navigatorKey,
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: HomePage.routeName,
        ),
      ),
    );
  }
}
