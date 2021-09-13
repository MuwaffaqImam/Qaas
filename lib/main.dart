import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/HomeScreen.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';

import '_qaas/models/Tenants.dart';

void main() => runApp(MainApp());

class MainApp extends MaterialApp {
  MainApp() : super(home: PostsPage());
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

