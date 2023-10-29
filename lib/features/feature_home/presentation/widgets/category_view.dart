import 'package:flutter/material.dart';
import 'package:navasan/core/utils/constants.dart';
import 'package:navasan/features/feature_home/data/models/Category_model.dart';

import '../../data/models/Productsmodel.dart';

class CategoryView extends StatefulWidget {
  final Categories c;
  CategoryView({Key? key, required this.c}) : super(key: key);

  @override
  State<CategoryView> createState() => _DaysWeatherViewState();
}

class _DaysWeatherViewState extends State<CategoryView> with SingleTickerProviderStateMixin{

  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    animation = Tween(
      begin: -1.0,
      end: 0.0,
    ).animate(CurvedAnimation(parent: animationController, curve: Interval(0.5, 1,curve: Curves.decelerate)));
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return AnimatedBuilder(
      animation: animationController,
      builder: (context,child){
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(0),
          padding: EdgeInsets.all(0),
          width: 200,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0x00ffffff),
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.zero,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child:

                ///***If you have exported images you must have to copy those images in assets/images directory.
                Image(
                  image: NetworkImage(
                      Constants.basecategoryimageurl+widget.c.icon!),
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Text(
                  widget.c.name!,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController.dispose();
    // _fwBloc.dispose();
    // _cwBloc.dispose();
    super.dispose();
  }
}
