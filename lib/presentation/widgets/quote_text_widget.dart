import 'dart:math';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/system_cuibt.dart';
import '../../constants/my_colors.dart';
import '../../data/models/quote.dart';

class QuoteTextWidget extends StatelessWidget {
  QuoteTextWidget({Key? key, required this.quote}) : super(key: key);
  List<Quote> quote;

  late int randomQuote;

  @override
  Widget build(BuildContext context) {
   var colorizeTextStyle = TextStyle(
      fontSize: 25.sp,
      fontFamily: 'Horizon',fontWeight: FontWeight.bold
    );
    List<Color> colorizeColors = [
      BlocProvider.of<SystemCubit>(context).light? MyColors.green: MyColors.yellow,
      MyColors.black,
      BlocProvider.of<SystemCubit>(context).light? MyColors.yellow:MyColors.green ,
      MyColors.grey,
    ];
    randomQuote = Random().nextInt(quote.length - 1);
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
        child: AnimatedTextKit(
          repeatForever: true,
isRepeatingAnimation:true,
          animatedTexts: [
            ColorizeAnimatedText(
             speed: const Duration(milliseconds: 450),
              quote[randomQuote].quote,
              textStyle: colorizeTextStyle,
              colors: colorizeColors,
            ),
          ],
        ),
      ),
    );
  }
}
