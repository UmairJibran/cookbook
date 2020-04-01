import 'package:cook_book/app.dart';
import 'package:cook_book/bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Color(0xff6B12D1)));
  runApp(
    // BlocProvider<NavigationBloc>(
    //   create: (_) => NavigationBloc()
    //     ..add(
    //       AppStarted(),
    //     ),
    // child: MyApp(),
    MyApp(),
    // ),
  );
}
