
import 'package:breaking_bad/business_logic/cubit/quote_cubit.dart';
import 'package:breaking_bad/business_logic/cubit/quote_state.dart';
import 'package:breaking_bad/presentation/widgets/quote_text_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../business_logic/cubit/system_cuibt.dart';
import '../../constants/arguments.dart';
import '../../constants/my_colors.dart';
import '../../data/models/quote.dart';
import '../widgets/list_details_actor_screen.dart';
class DetailsActorScreen extends StatefulWidget {
  DetailsActorArgument detailsActorArgument;
   DetailsActorScreen({Key? key,required this.detailsActorArgument}) : super(key: key);

  @override
  State<DetailsActorScreen> createState() => _DetailsActorScreenState();
}

class _DetailsActorScreenState extends State<DetailsActorScreen> {
  @override
   List<Quote> quote=[];
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<QuoteCubit>(context).getQuotes(widget.detailsActorArgument.actors.name);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(headerSliverBuilder:
        ((BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
                sliver: SliverAppBar(
                  pinned: true,
                  leading: const BackButton(
                    color: Colors.white,
                  ),
                  expandedHeight: 550.h,
                  backgroundColor: BlocProvider.of<SystemCubit>(context).light
                      ?MyColors.green
                      : MyColors.yellow,
                  floating: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(widget.detailsActorArgument.actors.name),
                    background: Hero(
                      tag: widget.detailsActorArgument.actors.id,
                      child: CachedNetworkImage(
                        imageUrl: widget.detailsActorArgument.actors.image,
                        fit: BoxFit.cover,
                        errorWidget: (context, url, error) {
                          //print(error);
                          if (error.toString() ==
                              "Failed host lookup: 'vignette.wikia.nocookie.net'") {
                            return const Center(
                                child: Icon(
                                  Icons.wifi_off,
                                  size: 70,
                                ));
                          }
                          //   print(error.);

                          return const Icon(
                            Icons.error,
                            size: 70,
                          );
                        },
                        placeholder: (context, url) => Image.asset(
                          "assets/images/lodingGreen.gif",
                        ),
                      ),
                    ),
                  ),
                ),
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context))
          ];
        }), body: Builder(builder: (context) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverOverlapInjector(
                  handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context)),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10.w, 5.h, 15.w, 10.h),
                  child: Column(
                    children: [
                       SizedBox(
                        height: 15.h,
                      ),
                      ListDetailsActorScreen(title: "Actor/Actress",value: widget.detailsActorArgument.actors.realNameActor),
                       SizedBox(
                        height: 15.h,
                      ),
                      ListDetailsActorScreen(title: "Job",value: widget.detailsActorArgument.actors.occupation.join(' & ')),
                       SizedBox(
                        height: 15.h,
                      ),
                      ListDetailsActorScreen(title: "Appeared in",value:widget.detailsActorArgument.actors.category),
                       SizedBox(
                        height: 15.h,
                      ),
                      ListDetailsActorScreen(title: "Seasons that appeared in",value: widget.detailsActorArgument.actors.numbersSeasonsAppeared.join(" - ")),
                       SizedBox(
                        height: 15.h,
                      ),
                      ListDetailsActorScreen(title: "Status",value: widget.detailsActorArgument.actors.occupationDeadOrLive),
                       SizedBox(
                        height: 40.h,
                      ),
BlocBuilder<QuoteCubit,QuoteState>(builder: (context, state) {
  if(state is QuoteLoading){
    return CircularProgressIndicator(
        color: BlocProvider.of<SystemCubit>(context).light
            ? MyColors.green
            : MyColors.yellow,);
  }
  else if(state is QuoteSuccess){
    quote=BlocProvider.of<QuoteCubit>(context).quote;
    return quote.isNotEmpty?QuoteTextWidget(quote: quote):Container();
  }
  else
    return Container();
},)
                    ],
                  ),
                ),
              )
            ],
          );
        })));
  }
}
