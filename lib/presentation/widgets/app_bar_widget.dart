import 'package:breaking_bad/business_logic/cubit/system_cuibt.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/my_colors.dart';

class AppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  var nameAppBar;
  TextEditingController controller;
  Function actionSearch;

  AppBarWidget(
      {Key? key,
      required this.nameAppBar,
      required this.controller,
      required this.actionSearch})
      : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool isSearch = false;

  @override
  Widget build(BuildContext context) {
    return isSearch
        ? AppBar(
            title: TextFormField(
              controller: widget.controller,
              onChanged: (v) {
                widget.actionSearch(widget.controller.text);
                if (v.length == 1 || v.length == 1) {
                  setState(() {});
                }
              },
              decoration: InputDecoration(
                  hintStyle: Theme.of(context).textTheme.subtitle2,
                  hintText: "Search...",
                  border: InputBorder.none),
              autofocus: true,
              cursorColor: BlocProvider.of<SystemCubit>(context).light
                  ? MyColors.yellow
                  : MyColors.green,
              style: Theme.of(context).textTheme.subtitle2,
            ),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                widget.controller.clear();
                widget.actionSearch(widget.controller.text);
                setState(() {
                  isSearch = !isSearch;
                });
              },
              icon: Icon(
                Icons.arrow_back,
              ),
            ),
            actions: [
                if (widget.controller.text.isNotEmpty)
                  IconButton(
                      onPressed: () {
                        widget.actionSearch(widget.controller.text);
                        widget.controller.clear();
                        setState(() {});
                      },
                      icon: Icon(
                        Icons.clear,
                      ))
              ])
        : AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    setState(() {
                      isSearch = !isSearch;
                    });
                  },
                  icon: Icon(
                    Icons.search,
                  )),
            ],
            title: Text("${widget.nameAppBar}",
                style: Theme.of(context).textTheme.subtitle2),
            centerTitle: true,
            leading: IconButton(
              onPressed: () {
                BlocProvider.of<SystemCubit>(context).changTheme();
              },
              icon: Icon(
                BlocProvider.of<SystemCubit>(context).light
                    ? Icons.dark_mode
                    : Icons.light_mode,
              ),
            ),
          );
  }
}
