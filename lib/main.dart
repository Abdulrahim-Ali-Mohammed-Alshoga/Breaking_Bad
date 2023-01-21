import 'dart:io';

import 'package:breaking_bad/business_logic/cubit/system_cuibt.dart';
import 'package:breaking_bad/business_logic/cubit/system_state.dart';
import 'package:breaking_bad/constants/my_colors.dart';
import 'package:breaking_bad/route_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'constants/hive_strings.dart';
import 'data/models/hive_models/actor_hive.dart';
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized() ;
  FlutterNativeSplash.preserve(widgetsBinding:WidgetsFlutterBinding.ensureInitialized());
  HttpOverrides.global = MyHttpOverrides();
  await Hive.initFlutter();
  Hive.registerAdapter(ActorsHiveAdapter());
  await Hive.openBox(lightOrDark);
  await Hive.openBox<ActorsHive>(actorBD);

  runApp( BlocProvider(create: (context) => SystemCubit()..isLight(),child: MyApp(routeApp: RouteApp(),)));
}

class MyApp extends StatelessWidget {
   MyApp({super.key,required this.routeApp});
  RouteApp routeApp;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      designSize:  const Size(412,844),
      splitScreenMode: true,
      builder: (BuildContext context,Widget? child) {
        return BlocBuilder<SystemCubit,SystemState>(builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: routeApp.generateRoute,

           color:  BlocProvider.of<SystemCubit>(context).light?MyColors.green:MyColors.yellow,
            themeMode: BlocProvider.of<SystemCubit>(context).light?ThemeMode.light:ThemeMode.dark,
            theme: ThemeData(
                textTheme:  TextTheme(
                  subtitle2: TextStyle(
                    color: Colors.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold
                  ),
                  subtitle1: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold
                  ),
                  headline1:  TextStyle(
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold
                  ),
                  headline2:  TextStyle(
                      color: Colors.black,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.bold
                  ),
                ),
                scaffoldBackgroundColor: MyColors.grey,
                cardColor: MyColors.green,
              //   primaryColor: MyColors.green,

                appBarTheme: const AppBarTheme( backgroundColor: MyColors.green,  iconTheme:  IconThemeData(color: Colors.white))
            ),
            darkTheme: ThemeData(

              textTheme: TextTheme(
                subtitle1: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold
                ),
                subtitle2: TextStyle(
                  color: Colors.black,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold
                ),
                headline1:  TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold
                ),
                headline2:  TextStyle(
                    color: Colors.white,
                    fontSize: 21.sp,
                    fontWeight: FontWeight.bold
                ),
              ),

                scaffoldBackgroundColor: MyColors.black,
cardColor:MyColors.yellow,
               // primaryColor: MyColors.yellow,

                appBarTheme: const AppBarTheme(backgroundColor: MyColors.yellow,  iconTheme:  IconThemeData(color: Colors.black),)
            ),
          )
            ;
        },

        );

      },
    );
  }
}



