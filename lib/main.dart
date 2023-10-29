import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navasan/core/widgets/main_warpper.dart';
import 'package:navasan/features/feature_home/presentation/bloc/home_bloc.dart';
import 'package:navasan/features/feature_home/presentation/screens/home_screen.dart';
import 'package:navasan/features/feature_product_detail/presentation/bloc/products_detail_bloc.dart';

import 'core/bloc/bottom_icon_cubit.dart';
import 'features/feature_authentication/presentation/bloc/auth_bloc.dart';
import 'features/feature_authentication/presentation/screens/first_login_screen.dart';
import 'locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => locator<HomeBloc>()),
          BlocProvider(create: (_) => locator<AuthBloc>()),
          BlocProvider(create: (_) => locator<BottomIconCubit>()),



        ],
        child: FirstLoginScreen(),
      )
  ));
}


