import 'package:breaking_bad/data/models/actors.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/arguments.dart';
import '../../constants/strings.dart';

class GridTitleWidget extends StatelessWidget {
  Actors actors;

  GridTitleWidget({Key? key, required this.actors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          detailsActorScreen,
          arguments: DetailsActorArgument(actors),
        );
      },
      child: Hero(
        tag: actors.id,
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10).r),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(3).w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10).r,
                child: GridTile(
                    footer: Container(
                      height: 35.h,
                      color: Colors.black54,
                      child: Center(
                          child: Text(
                        actors.name,
                        style: const TextStyle(
                            overflow: TextOverflow.ellipsis,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      )),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: "${actors.image}",
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) {
                        print(error);
                        if (error.toString() ==
                                "Failed host lookup: 'vignette.wikia.nocookie.net'" ||
                            error.toString() ==
                                "Failed host lookup: 'res.cloudinary.com'")
                        {
                          return  Center(
                              child: Icon(
                            Icons.wifi_off,
                            size: 70.sp,
                          ));
                        }
                        //   print(error.);

                        return  Center(
                          child: Icon(
                            Icons.image_not_supported,
                            size: 70.sp,
                          ),
                        );
                      },
                      placeholder: (context, url) => Image.asset(
                        "assets/images/lodingGreen.gif",
                      ),
                    )),
              ),
            )),
      ),
    );
  }
}
