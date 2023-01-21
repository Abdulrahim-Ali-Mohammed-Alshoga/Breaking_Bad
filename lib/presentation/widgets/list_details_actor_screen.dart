import 'package:breaking_bad/business_logic/cubit/actor_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/system_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/my_colors.dart';
class ListDetailsActorScreen extends StatelessWidget {
   ListDetailsActorScreen({Key? key,required this.title,required this.value}) : super(key: key);
String title;
String value;
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        children: [
           VerticalDivider(
              color: BlocProvider.of<SystemCubit>(context).light? MyColors.green: MyColors.yellow, indent: 2, thickness: 5),
           SizedBox(
            width: 10.w
          ),
          Flexible(
              child: RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "$title: ",
                    style: Theme.of(context).textTheme.headline1
                  ),
                  TextSpan(
                      text: value,
                      style:Theme.of(context).textTheme.subtitle1
                  ),
                ]),
              )),
        ],
      ),
    );
  }
}
