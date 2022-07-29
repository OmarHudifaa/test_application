import 'dart:convert';

import 'package:asset_people_application/classes/WordkOrder.dart';
import 'package:asset_people_application/core/data/app_shared_prefs.dart';
import 'package:asset_people_application/core/injections.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Workorder? _workorder;

  @override
  void initState() {
    super.initState();
    getWorkOrders().then((value) => setState(() {
          _workorder = value;
        }));
  }

  final iconList = <IconData>[Icons.home_outlined, Icons.content_paste, Icons.favorite_border_outlined, Icons.person_outline];
  var _bottomNavIndex = 0;
  List months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sept", "Oct", "Nov", "Dec"];
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.only(left: 10,bottom: 10),
          child: InkWell(onTap:(){},
              child: const CircleAvatar()),
        ),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.notifications_none,color: Theme.of(context).primaryColor,size: 25,))],
      ),*/

      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.calendar_month_outlined,
          color: Colors.white,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 25,
        onPressed: () {
          Navigator.pushNamed(context, "CalenderScreen");
        },
        //params
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Theme.of(context).primaryColor : Colors.grey;
          return Icon(
            iconList[index],
            size: 25,
            color: color,
          );
        },
        backgroundColor: Colors.white,
        activeIndex: _bottomNavIndex,
        splashColor: Theme.of(context).primaryColor,
        splashSpeedInMilliseconds: 300,
        notchSmoothness: NotchSmoothness.defaultEdge,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
        shadow: const BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 12,
          spreadRadius: 0.5,
          color: Colors.grey,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          decoration: BoxDecoration(color: Theme.of(context).primaryColor),
          child: SafeArea(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, right: 20),
                  alignment: Alignment.centerRight,
                  child: RichText(
                    text: TextSpan(
                        text: (DateFormat('EEE').format(now)).toString(),
                        style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w900,
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)]),
                        children: [
                          const TextSpan(
                              text: "  ", style: TextStyle(shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)])),
                          TextSpan(
                              text: DateFormat('dd').format(DateTime.now()).toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)])),
                          const TextSpan(text: " ", style: TextStyle(shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)])),
                          TextSpan(
                              text: months[DateTime.now().month - 1],
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.normal,
                                  shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)]))
                        ]),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Hi",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                            shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Here is a list of schedule you need to check ...",
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            letterSpacing: 1,
                            shadows: [Shadow(offset: Offset(10, 10), blurRadius: 25, color: Colors.black)]),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                /*FutureBuilder<List<Workorder>>(
                future: getWorkOrders(),
                builder: (context,snapshot){
                  print(snapshot.data);
                  if(snapshot.hasData){
                    final workOrders=snapshot.data!;
                    return Container(
                        width: double.maxFinite,
                        height: height* 0.08,
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                            boxShadow: [ BoxShadow(offset:Offset(20,10),blurRadius: 50)]
                        ),
                        child: buildWorkOrder(workOrders));
                  }else{
                    return Container(
                      width: double.maxFinite,
                      height: height,
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                          boxShadow: [ BoxShadow(offset:Offset(20,10),blurRadius: 50)]
                      ),
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                              width: double.maxFinite,
                              height: height* 0.08,
                              decoration: BoxDecoration(

                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: const [ BoxShadow(offset:Offset(10, 10),blurRadius: 25)]
                              ),
                              child: Text("No Work orders!!!")
                          ),
                        ],
                      ),
                    );
                  }
              }
              )*/
                ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: _workorder == null ? 0 : _workorder?.member.length,
                    itemBuilder: (context, index) {
                      // final workorder = _workorder[index];
                      return Container(
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: const [BoxShadow(offset: Offset(10, 10), blurRadius: 25)]),
                          child: Row(
                            children: [
                              // Text(workorder.member[index].firstname),
                            ],
                          ));
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<Workorder> getWorkOrders() async {
    ///todo this is the restapi for the workorders the needed i need to show in the list in each container wonum status description(is the title) and long description and send them to the deatilas screen
    ///todo the owner in the restapi below is the userid it should be variable
    try {
      var response = await http.get(
          Uri.parse(
              "https://ap-acc.maximo.nl/maximo/api/os/MXAPIWODETAIL?lean=1&mxlaction=query&oslc.select=wonum,siteid,description,longdescription.ldtext,status&oslc.pageSize=100&oslc.where=owner=%22${sl<AppSharedPrefs>().getUserId().toString()}%22"),
          headers: ({"apikey": sl<AppSharedPrefs>().getApiKey().toString()}));
      var jsonData = json.decode(response.body);
      final Workorder workorders = workorderFromJson(jsonData);
      if (response.statusCode == 200) {
        return workorders;
        /* setState((){
         member=jsonData.entries.forEach((e) => Member.fromJson(jsonData));
        });*/
        //return Member.fromJson(jsonData);
        //jsonData.forEach((k, v) =>members=Member.fromJson(jsonData));
      } else {
        throw Text("Null");
      }
    } catch (e) {
      throw Text(e.toString());
    }
  }
}
