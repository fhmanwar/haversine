import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:gostore_flutter/src/models/Citys.dart';
import 'package:gostore_flutter/src/models/Stores.dart';
import 'package:gostore_flutter/src/services/api_services.dart';
import 'package:http/http.dart' as http;

import '../models/Stores.dart';
import '../models/Stores.dart';
import '../models/Stores.dart';
import '../services/api_services.dart';
import '../services/api_services.dart';
import 'item_horizontal.dart';
import 'item_horizontal.dart';

class Home extends StatefulWidget {
  Home() : super();
  final String title = "BLK Finder";
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // var url = "http://192.168.0.2/gostoreadmin/api.php";
  var url = "http://172.20.10.4/haversine_webnative/api.php";
  Citys city;
  Stores stores;
  ApiServices _apiServices;
  StreamController<int> streamController = new StreamController<int>();

  String _search;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiServices = ApiServices();
    showAllData();
  }

  showAllData() async {
    var res_city = await http.get('$url?city');
    var res = await http.get('$url?allstore');
    // print(res.body);
    // print(res_city.body);
  }

  circularProgress() {
    return Center(
      child: const CircularProgressIndicator(),
    );
  }

  check() async {
    // final form = _key.currentState;
    print('$_search');
    var res = await http.get(Uri.encodeFull('$url?searchtext=$_search'),
        headers: {"Accept": "application/json"});
    // print(res.body);
    // var convertDataToJson = jsonDecode(res.body);
    var cekstores = json.decode(res.body);
    // print(cekstores['msg'].length);
    if (cekstores['msg'].length == 0) {
      print("null");
    } else {
      print(cekstores['msg'][0]['name']);
    }
    // if (form.validate()) {
    //   form.save();
    //   // setState(() {
    //   //   // Navigator.pop(context);
    //   // });
    //   // // submit();
    //   // _generate(context);
    // }
  }

  itemStoreView(AsyncSnapshot<List<Stores>> list){
    return Padding(
      padding: EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: list.data.map(
          (anggrek){
            return GestureDetector(
              child: GridTile(
                child: ItemHorizontal(stores),
              ),
              onTap: () {
                // setState(() {
                //   total += anggrek.price;
                // });
              },
            );
          },
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: <Widget>[
            Container(
              color: Colors.amber[800],
              width: MediaQuery.of(context).size.width,
              height: 100.0,
              child: Center(
                child: Text(
                  "BLT Finder",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 75.0,
              left: 0.0,
              right: 0.0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.5),
                      width: 1.0,
                    ),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.0),
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search",
                              icon: Icon(Icons.search),
                            ),
                            onSubmitted: (value) {
                              _search = value;
                              check();
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.map,
                                  color: Colors.amber[800],
                                ),
                                onPressed: () {},
                              ),
                              VerticalDivider(
                                color: Colors.amber[800],
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.more_vert,
                                  color: Colors.amber[800],
                                ),
                                onPressed: () {
                                  _onBottomPressed();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned.fill(
              top: 130.0,
              left: 0.0,
              right: 0.0,
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        itemExtent: 150,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) => Container(
                          margin: EdgeInsets.all(5.0),
                          color: Colors.amberAccent,
                        ),
                        itemCount: 20,
                      ),
                    ),
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 1.5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      // (context, index) => Container(
                      //   margin: EdgeInsets.all(5.0),
                      //   color: Colors.yellow,
                      // ),
                      (context, index) {
                        return FutureBuilder(
                          future: ApiServices.getListStore(),
                          builder: (context, snap){
                            if (snap.hasError) {
                              return Text('Error ${snap.error}');
                            }
                            //
                            if (snap.hasData) {
                              streamController.sink.add(snap.data.length);
                              // gridview
                              // return itemStoreView(snap);
                            }
                            // return snap.connectionState == ConnectionState.done? snap.hasData ? ItemHorizontal(snap.data[index]) :  Text('Retry') : circularProgress();
                          },
                        );
                      }
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      // Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisSize: MainAxisSize.min,
      //   children: <Widget>[
      //     Flexible(
      //       child: SafeArea(
      //         child: Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20),
      //           child: SearchBar<Stores>(
      //             onSearch: search,
      //             onItemFound: (Stores stores, int index) {
      //               return ListTile(
      //                 title: Text(stores.name),
      //                 subtitle: Text(stores.description),
      //               );
      //             },
      //           ),
      //         ),
      //       ),
      //     ),
    );
  }

  void _onBottomPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
              color: Colors.black54,
              height: 300,
              child: Container(
                child: Column(
                  children: <Widget>[
                    ListTile(
                      leading: Icon(Icons.call),
                      title: Text('Call Center'),
                      // onTap: () => _service.call(number),
                    ),
                    ListTile(
                      leading: Icon(Icons.message),
                      title: Text('SMS Center'),
                      // onTap: () => _service.msg(number),
                    ),
                    ListTile(
                      leading: Icon(Icons.map),
                      title: Text('Maps/Lokasi'),
                      // onTap: () =>
                      //     MapsLauncher.launchCoordinates(-6.9829, 110.4091),
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => MapsLoc(),
                      //   ),
                      // ),
                    ),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Profile'),
                      // onTap: () => Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => Profile(),
                      //   ),
                      // ),
                      // onTap: () => Navigate.gotoProfile(context),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                    color: Theme.of(context).canvasColor,
                    borderRadius: BorderRadius.only(
                      topRight: const Radius.circular(30),
                      topLeft: const Radius.circular(30),
                    )),
              ));
        });
  }
}
