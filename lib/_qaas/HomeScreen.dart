import 'dart:collection';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_template/Data_Model/dinner.dart';
import 'package:food_template/Data_Model/lunch.dart';
import 'package:food_template/Screen/Template1/B1_Home_Screen/Detail_Home_Screen/Banner_Screen.dart';
import 'package:food_template/Screen/Template1/B1_Home_Screen/Detail_Home_Screen/Category_Screen.dart';
import 'package:food_template/Screen/Template1/B1_Home_Screen/Detail_Home_Screen/Detail_Food_Screen.dart';
import 'package:food_template/Screen/Template1/B1_Home_Screen/Search_Screen/Search_Screen_T1.dart';
import 'package:food_template/_qaas/res/Colors.dart';

import 'bloc/tenants/tenants_bloc.dart';
import 'models/Tenants.dart';

class HomeScreenT1 extends StatefulWidget {
  HomeScreenT1({Key key}) : super(key: key);

  @override
  _HomeScreenT1State createState() => _HomeScreenT1State();
}

class _HomeScreenT1State extends State<HomeScreenT1> {
  @override
  List<String> _image = [
    "assets/Template1/banner/1.jpg",
    "assets/Template1/banner/2.jpg",
    "assets/Template1/banner/3.jpg",
    "assets/Template1/banner/4.jpg",
    "assets/Template1/banner/5.jpg",
    "assets/Template1/banner/6.jpg",
    "assets/Template1/banner/7.jpg",
  ];

  var _background = Stack(
    children: <Widget>[
      Image(
        image: AssetImage('assets/Template1/image/profileBackground.png'),
        height: 350.0,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
      Container(
        height: 355.0,
        margin: EdgeInsets.only(top: 0.0, bottom: 105.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset(0.0, 0.0),
            end: FractionalOffset(0.0, 1.0),
            // stops: [0.0, 1.0],
            colors: <Color>[
              Color(0xFF1E2026).withOpacity(0.1),
              Color(0xFF1E2026).withOpacity(0.3),
              Color(0xFF1E2026),
              //  Color(0xFF1E2026),
            ],
          ),
        ),
      ),
    ],
  );

  var _appBar = Align(
    alignment: Alignment.centerRight,
    child: Padding(
      padding: const EdgeInsets.only(top: 37.0, left: 20.0, right: 15.0),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "QAAS",
              style: TextStyle(
                  fontFamily: "Sofia",
                  fontWeight: FontWeight.w800,
                  fontSize: 30.0,
                  letterSpacing: 1.5,
                  color: Colors.white),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 10.0),
              child: Container(
                height: 50.0,
                width: 50.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          "https://images2.imgbox.com/7d/50/GDU0vQnM_o.png",
                          errorListener: () => new Icon(Icons.error),
                        ),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.all(Radius.circular(150.0))),
              ),
            ),
          ]),
    ),
  );

  Widget buildCategoriesView(String cat, List<Tenant> tenants) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 30.0),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  // tenants.first?.category?.name,
                  cat,
                  style: TextStyle(
                      fontFamily: "Sofia",
                      fontSize: 18.5,
                      color: Colors.white.withOpacity(0.9),
                      fontWeight: FontWeight.w600),
                ),
                // Text(
                //   "See all",
                //   style: TextStyle(
                //       fontFamily: "Sofia",
                //       color: Colors.white54,
                //       fontSize: 15.0,
                //       fontWeight: FontWeight.w300),
                // ),
              ]),
        ),
        Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            child: Container(
              height: 140.0,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return TenantCard(
                        colorTop: Color(0xFF1E2026),
                        colorBottom: Color(0xFF23252E),
                        image: index % 2 == 0
                            ? "assets/icon/bank2.jpeg"
                            : "assets/icon/bank.png",
                        title: tenants[index].name);
                  },
                  padding: EdgeInsets.only(left: 20),
                  itemCount: tenants.length),
            )),
      ],
    );
  }

  Widget build(BuildContext context) {
    var _search = Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(PageRouteBuilder(
                pageBuilder: (_, __, ___) => new searchAppbar()));
          },
          child: Container(
            height: 45.0,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Color(0xFF23252E),
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5.0,
                      spreadRadius: 0.0)
                ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.search,
                    color: Color(0xFFFF975D),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "Search",
                    style: TextStyle(
                        fontFamily: "Sofia",
                        fontWeight: FontWeight.w400,
                        color: Colors.white70,
                        fontSize: 16.0),
                  )
                ],
              ),
            ),
          ),
        ));

    var _sliderImage = Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: CarouselSlider(
        options: CarouselOptions(
          height: 200,
          aspectRatio: 24 / 18,
          viewportFraction: 0.9,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        items: _image.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(PageRouteBuilder(
                      pageBuilder: (_, __, ___) => new BannerScreen1(
                            image: i,
                          )));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(i), fit: BoxFit.cover),
                      color: Color(0xFF23252E)),
                ),
              );
            },
          );
        }).toList(),
      ),
    );

    var _body = Padding(
      padding: const EdgeInsets.only(top: 120.0),
      child: Column(
        children: <Widget>[
          _search,
          _sliderImage,
          blocCategory(),
        ],
      ),
    );

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF975D),
        onPressed: () {},
        child: const Icon(Icons.qr_code_2_rounded,color: Color(0xFF23252E)),
        tooltip: 'Create',
      ),
      bottomNavigationBar: buildBottomBar(),
      backgroundColor: Color(0xFF23252E),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            _background,
            _appBar,
            _body,
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      color: Colors.white12,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 56,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.menu_rounded),
                    onPressed: () {},
                  ),
                  Text('More',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 56,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.location_on_rounded),
                    onPressed: () {},
                  ),
                  Text('location',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 56,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.event),
                    onPressed: () {},
                  ),
                  Text('Tickets',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 56,
              child: Column(
                children: [
                  IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {},
                  ),
                  Text('Profile',style: TextStyle(color: Colors.white),)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget blocCategory() {
    return BlocBuilder<TenantsBloc, TenantsState>(
      builder: (context, state) {
        if (state is TenantsLoading)
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
                child: const CircularProgressIndicator(
              color: Colors.amber,
            )),
          );
        else if (state is TenantsFailure) {
          return const Center(child: Text('no posts'));
        } else {
          List<Tenant> tenants = (state as TenantsSuccess).tenantsList;
          HashMap<String, List<Tenant>> map = HashMap();
          map.putIfAbsent("Banks", () => tenants);
          map.putIfAbsent("Government", () => tenants);
          map.putIfAbsent("Malls", () => tenants);
          return ListView.builder(
            shrinkWrap: true,
            itemCount: 3,
            itemBuilder: (BuildContext context, int index) {
              String key = map.keys.elementAt(index);
              return buildCategoriesView(key, map[key]);
            },
          );
        }
      },
    );
  }
}

class TenantCard extends StatelessWidget {
  Color colorTop, colorBottom;
  String image, title;

  TenantCard({this.colorTop, this.colorBottom, this.title, this.image});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 4.0, top: 3.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(PageRouteBuilder(
              pageBuilder: (_, __, ___) => new CategoryScreenT1(
                    title: title,
                  ),
              transitionDuration: Duration(milliseconds: 1000),
              transitionsBuilder:
                  (_, Animation<double> animation, __, Widget child) {
                return Opacity(
                  opacity: animation.value,
                  child: child,
                );
              }));
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 95.0,
              width: 95.0,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(blurRadius: 8.0, color: Colors.black54)],
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                gradient: LinearGradient(
                    colors: [colorTop, colorBottom],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 4.0),
                child: Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      image,
                      height: 60,
                    )),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text(
                title,
                style: TextStyle(
                    color: Colors.white70,
                    fontFamily: "Sofia",
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
