import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/_qaas/bloc/tenants/tenants_bloc.dart';

void main() => runApp(MainApp());


class MainApp extends MaterialApp {
  MainApp() : super(home: PostsPage());
}

class PostsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocProvider(
        create: (_) =>
        TenantsBloc()
          ..add(TenantList()),
        child: PostsList(),
      ),
    );
  }
}


class PostsList extends StatefulWidget {
  @override
  _PostsListState createState() => _PostsListState();
}

class _PostsListState extends State<PostsList> {
  final _scrollController = ScrollController();
  TenantsBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = context.read<TenantsBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        _postBloc.add(TenantList());
      },),
      body: BlocBuilder<TenantsBloc, TenantsState>(
        builder: (context, state) {
          if (state is TenantsLoading)
            return const CircularProgressIndicator();
          else if (state is TenantsFailure) {
            return const Center(child: Text('no posts'));
          }
          else {
            return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('$state'));
                },
                itemCount: 3
            );
          }
        },

      ),
    );
  }

}

