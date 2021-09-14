import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/HomeScreen.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';

import 'Screen/Template1/Login_Screen/SignIn_Screen.dart';
import 'Screen/Template1/OnBoarding_Screen/Choose_Login.dart';
import '_qaas/bloc/login/login_bloc.dart';
import '_qaas/bloc/login/login_state.dart';
import '_qaas/models/Tenants.dart';

Future<void> main()  async {

//  WidgetsFlutterBinding.ensureInitialized();
//  await Firebase.initializeApp();
  runApp(MainApp());}

class MainApp extends MaterialApp {
  MainApp()
//      : super(home: PostsPage());
//      : super(home: signinTemplate1());
      : super(
      home:
      BlocProvider(
        create: (context) => LoginBloc(InitialState()),
        child: chooseLogin(),
      ));
}

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (_) => TenantsBloc()..add(TenantList()),
        child: HomeScreenT1(),

      ),
    );
  }
}

