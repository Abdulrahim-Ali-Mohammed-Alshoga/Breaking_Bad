import 'dart:async';
import 'package:breaking_bad/business_logic/cubit/actor_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/actor_state.dart';
import 'package:breaking_bad/business_logic/cubit/system_cuibt.dart';
import 'package:breaking_bad/data/models/actors.dart';
import 'package:breaking_bad/presentation/widgets/app_bar_widget.dart';
import 'package:breaking_bad/presentation/widgets/grid_view_widget.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/my_colors.dart';
class ActorScreen extends StatefulWidget {
  const ActorScreen({Key? key}) : super(key: key);

  @override
  State<ActorScreen> createState() => _ActorScreenState();
}

class _ActorScreenState extends State<ActorScreen> {
  late StreamSubscription<ConnectivityResult> subscription;
  late ConnectivityResult stateContact;
  TextEditingController controller1 = TextEditingController();
  List<Actors> actors = [];
  List<Actors> actorsSearch = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      BlocProvider.of<ActorCubit>(context).getAllActors();
    });
    Future.delayed(const Duration(milliseconds: 1000))
        .then((value) => FlutterNativeSplash.remove());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    subscription.cancel();
  }

  searchList(String wordSearch) {
    setState(() {
      actorsSearch = actors
          .where((element) => element.name.toLowerCase().startsWith(wordSearch))
          .toList();
    });
  }

  Widget build(BuildContext context) {
    // print( WidgetsBinding.instance.window.physicalSize.width);
    // print( WidgetsBinding.instance.window.physicalSize.height);
    return Scaffold(
        appBar: AppBarWidget(
            nameAppBar: 'Characters',
            controller: controller1,
            actionSearch: searchList),
        body: BlocBuilder<ActorCubit, ActorState>(
          builder: (context, state) {
            if (state is ActorInitialState) {
              return Container();
            } else if (state is NotConnected) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                        height: 150.h,
                        width: 150.w,
                        BlocProvider.of<SystemCubit>(context).light
                            ? "assets/images/wifi_outline.gif"
                            : "assets/images/wifi_outline1.gif"),
                    SizedBox(
                      height: 15,
                    ),
                    Text("You're offline",
                        style: Theme.of(context).textTheme.headline2),
                  ],
                ),
              );
            } else if (state is ActorLoading) {
              return Center(
                child: SizedBox(
                  height: 50.h,
                  width: 50.w,
                  child: CircularProgressIndicator(
                    // backgroundColor: Colors.greenAccent,
                    strokeWidth: 7,
                    //backgroundColor: Colors.black26,
                    color: BlocProvider.of<SystemCubit>(context).light
                        ? MyColors.green
                        : MyColors.yellow,
                    // strokeWidth: 100,
                  ),
                ),
              );
            } else {
              actors = BlocProvider.of<ActorCubit>(context).actors;
              return controller1.text.isEmpty
                  ? GridViewWidget(
                      actors: actors,
                    )
                  : GridViewWidget(
                      actors: actorsSearch,
                    );
            }
          },
        ));
  }
}
