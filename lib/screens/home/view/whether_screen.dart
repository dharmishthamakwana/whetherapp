import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/whether_modal.dart';
import '../provider/whether_provider.dart';

class First_Screen extends StatefulWidget {
  const First_Screen({Key? key}) : super(key: key);

  @override
  State<First_Screen> createState() => _First_ScreenState();
}

class _First_ScreenState extends State<First_Screen> {
  WhtherProvider? wproviderT;
  WhtherProvider? wproviderF;

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> _scaffold = GlobalKey<ScaffoldState>();
    wproviderT = Provider.of<WhtherProvider>(context, listen: true);
    wproviderF = Provider.of<WhtherProvider>(context, listen: false);
    return Scaffold(
      key: _scaffold,
      endDrawer: Drawer(
        child: Stack(
          children: [
            Container(
              height: double.infinity,
              width: double.infinity,
              color: Colors.black,
              child:  Image.asset(
                "assets/image/pexels-paul-basel-1816823.jpg",
                fit: BoxFit.cover,
                height: double.infinity,
                scale: 1,
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.85,
              height: double.infinity,
              child: ListView.builder(
                itemCount: wproviderF!.city.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      wproviderT!.changeapi(wproviderF!.long[index],
                          wproviderF!.lat[index], index);
                    },
                    title: Text(
                      "${wproviderF!.city[index]}",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: wproviderT!.getwether(wproviderT!.lati, wproviderT!.logi),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              Weathermodal? p1 = snapshot.data!;
              return Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.network(
                      "${wproviderF?.imgage}",
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                      scale: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                ),
                                IconButton(
                                    onPressed: () {
                                      _scaffold.currentState!.openEndDrawer();
                                    },
                                    icon: Icon(
                                      Icons.location_on_sharp,
                                      size: 30,
                                    )),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 90,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "☀️",
                                style: TextStyle(fontSize: 60),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "18 oct",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  Text(
                                    "  Monday",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            children: [
                              Text(
                                "${p1.main!.temp}°",
                                style: TextStyle(
                                    fontSize: 65, color: Colors.white),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${p1.weather![0].main}",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 180,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 2,
                                      blurStyle: BlurStyle.inner,
                                      offset: Offset(1, 0)),
                                ],
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.1),
                                      Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 23, left: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "🌡 ${p1.main!.temp}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 0000,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.15,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            top: 23, right: 20),
                                        child: Column(
                                          children: [
                                            Text(
                                              "☁️${p1.clouds!.all}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            Text(
                                              "Colude",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 35,
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, bottom: 23),
                                        child: Column(
                                          children: [
                                            Text(
                                              "💨  ${p1.wind!.speed}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            Text(
                                              "Temperature",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 0,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 20, bottom: 23),
                                        child: Column(
                                          children: [
                                            Text(
                                              "🔼️ ${p1.wind!.deg}",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 25),
                                            ),
                                            Text(
                                              "Colude",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Text(
                            " -------------------  More Details  --------------------",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.85,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black38,
                                      spreadRadius: 2,
                                      blurStyle: BlurStyle.inner,
                                      offset: Offset(1, 0)),
                                ],
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                  style: BorderStyle.solid,
                                ),
                                gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFffffff).withOpacity(0.1),
                                      Color(0xFFFFFFFF).withOpacity(0.05),
                                    ],
                                    stops: [
                                      0.1,
                                      1,
                                    ]),
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Humidity",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "💧",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${p1.main!.humidity}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Visibility",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "👁",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${p1.visibility}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Column(
                                      children: [
                                        Text(
                                          "sunrice",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "🌅",
                                          style: TextStyle(fontSize: 25),
                                        ),
                                        SizedBox(
                                          height: 8,
                                        ),
                                        Text(
                                          "${p1.sys!.sunrise}",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
