import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/widgets/bottom_nav.dart';
import 'package:navasan/features/feature_authentication/presentation/screens/login_screen.dart';
import 'package:navasan/features/feature_home/presentation/screens/home_screen.dart';
import 'package:navasan/features/feature_home/presentation/screens/products_list.dart';
import 'package:navasan/locator.dart';

import '../../features/feature_home/presentation/bloc/home_bloc.dart';

class MainWarpper extends StatelessWidget
{
  MainWarpper({Key? key}):super(key: key);
  final PageController _mypage=PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final List<Widget> pageViewWidget=[
      HomeScreen(pageController: _mypage,),
      LoginScreen(pageController: _mypage,),

    ];
    return Scaffold(
      bottomNavigationBar: BottomNav(controller: _mypage),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: PageView(
          controller: _mypage,
          //physics: const NeverScrollableScrollPhysics(),
          children: pageViewWidget,
        ),
      ),
    );
  }

}