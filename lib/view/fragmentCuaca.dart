import 'package:flutter/material.dart';
import 'package:aplikasi_cuaca/adapter/kodeCuaca.dart';

class fragmentCuaca extends StatefulWidget {
  const fragmentCuaca(
      {Key key,
        this.judul,
        this.header,
        this.data,
      });

  final String judul;
  final List<dynamic> header;
  final List<dynamic> data;


  @override
  State<fragmentCuaca> createState() => _fragmentCuacaState();
}

class _fragmentCuacaState extends State<fragmentCuaca> {
  Map<String, dynamic> Wheather;
  Map<String, dynamic> Temp;
  Map<String, dynamic> WindDirect;
  Map<String, dynamic> WindSpeed;
  Map<String, dynamic> Humidity;

  @override
  void initState(){
    Wheather = widget.data[6];
    Temp = widget.data[5];
    WindDirect = widget.data[7];
    WindSpeed = widget.data[8];
    Humidity = widget.data[0];

    debugPrint(Wheather['timerange'][1].toString());
  }

  Widget informasiCuaca(h, w, start, last){
    double widthCol = w / 4;
    double heightColumn = (h / 4) - 60;
    List<dynamic> hari = ["06:00", "12:00", "18:00", "24:00", "06:00", "12:00", "18:00", "24:00", "06:00", "12:00", "18:00", "24:00"];

    final children = <Widget>[];
    for (int i = start; i <= last; i++){
      children.add(Container(
        padding: const EdgeInsets.all(0),
        width: widthCol,
        height: heightColumn,
        child: Column(children: [
          Text(hari[i],
              style: const TextStyle(color: Colors.black, fontSize: 14)),
          iconCuaca(Wheather['timerange'][i]['value']['\$t'], 35),
          const SizedBox(height: 13),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Temp['timerange'][i]['value'][0]['\$t'].toString(),
                  style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
              CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 8,
                child: Image.asset('assets/icon_cuaca/celcius.png'),
              ),
            ],
          )
        ]),
      ));
    }
    return Row(
      children: children,
    );
  }
  Widget topInfo(h, w, index) {
    double widthCol = w / 2;
    double heightColumn = (h / 4) + 20;
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: widthCol,
          height: heightColumn,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                iconCuaca(
                    Wheather['timerange'][index]['value']['\$t'].toString(),
                    78),
                const SizedBox(height: 25),
                Text(
                   kodeCuaca(
                        Wheather['timerange'][index]['value']['\$t']),
                    style: const TextStyle(color: Colors.black, fontSize: 18)),
                Row(
                  children: [
                    Text(
                        Temp['timerange'][index]['value'][0]['\$t']
                            .toString(),
                        style:
                        const TextStyle(color: Colors.black, fontSize: 32)),
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 8,
                      child: Image.asset('assets/icon_cuaca/celcius.png'),
                    ),
                  ],
                )
              ]),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: widthCol,
          height: heightColumn,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  widget.header[0]['\$t'].toString(),
                  textAlign: TextAlign.right,
                  style: const TextStyle(fontSize: 22, color: Colors.black),
                ),
                Text("(${widget.header[1]['\$t']})",
                    textAlign: TextAlign.right,
                    style: const TextStyle(fontSize: 14, color: Colors.black)),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        // const Icon(Icons.water_drop,
                        //     color: Colors.blueAccent, size: 28),
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 8,
                          child: Image.asset('assets/icon_cuaca/humidity.png'),
                        ),
                        // const Text("Humidity"),
                        const SizedBox(height: 8),
                        Text(
                            "${Humidity['timerange'][index]['value']['\$t']}%",
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        const SizedBox(height: 20),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 8,
                          child: Image.asset('assets/icon_cuaca/wind_speed.png'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            WindSpeed['timerange'][index]['value'][2]['\$t']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        Container(
                            margin: const EdgeInsets.all(0),
                            height: 20,
                            child: const Text("km/jam",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))),
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 8,
                          child: Image.asset('assets/icon_cuaca/compas_points.png'),
                        ),
                        const SizedBox(height: 8),
                        Text(
                            WindDirect['timerange'][index]['value'][1]
                            ['\$t']
                                .toString(),
                            style: const TextStyle(
                                fontSize: 14, color: Colors.black)),
                        const SizedBox(height: 20),
                      ],
                    )
                  ],
                )
              ]),
        ),
      ],
    );
  }
  Widget bottomInfo(h, w, data) {
    double widthCol = w / 4;
    double heightColumn = (h / 4) - 60;

    Map<String, dynamic> cuacaPagi = data[1];
    Map<String, dynamic> cuacaSiang = data[2];
    Map<String, dynamic> cuacaSore = data[3];
    Map<String, dynamic> cuacaMalam = data[4];

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Pagi",
                style: TextStyle(color: Colors.black, fontSize: 12)),
            iconCuaca(Wheather['timerange'][1]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaPagi['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.black)),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 8,
                  child: Image.asset('assets/icon_cuaca/celcius.png'),
                ),
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Siang",
                style: TextStyle(color: Colors.black, fontSize: 12)),
            iconCuaca(Wheather['timerange'][2]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaSiang['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.black)),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 8,
                  child: Image.asset('assets/icon_cuaca/celcius.png'),
                ),
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Malam",
                style: TextStyle(color: Colors.black, fontSize: 12)),
            iconCuaca(Wheather['timerange'][3]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaSore['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.black)),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 8,
                  child: Image.asset('assets/icon_cuaca/celcius.png'),
                ),
              ],
            )
          ]),
        ),
        Container(
          padding: const EdgeInsets.all(0),
          width: widthCol,
          height: heightColumn,
          child: Column(children: [
            const Text("Dini Hari",
                style: TextStyle(color: Colors.black, fontSize: 12)),
            iconCuaca(Wheather['timerange'][4]['value']['\$t'], 35),
            const SizedBox(height: 13),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(cuacaMalam['value'][0]['\$t'].toString(),
                    style: const TextStyle(color: Colors.black)),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 8,
                  child: Image.asset('assets/icon_cuaca/celcius.png'),
                ),
              ],
            )
          ]),
        )
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    final heightScreen = MediaQuery.of(context).size.height;
    Size screenSize = MediaQuery.of(context).size;

    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.judul),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Hari ini",
              ),
              Tab(
                text: "Besok",
              ),
              Tab(
                text: "Lusa",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/pineVectoreBG.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                        color: Colors.transparent,
                        margin: const EdgeInsets.only(top: 8),
                        padding: const EdgeInsets.only(top: 2.0, right: 8.0, bottom: 2.0, left: 8.0),
                        child: const Text("info BMKG", style: TextStyle(fontSize: 12, color: Colors.black),)
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen, 0),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(width: 0.8, color: Colors.black),
                              ),
                            ),
                            child: const Text("Prakiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          //bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                          informasiCuaca(heightScreen, widthScreen, 0, 3)
                        ]),
                      ))
                ]),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/pineVectoreBG.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen, 4),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(width: 0.8, color: Colors.black),
                              ),
                            ),
                            child: const Text("Prakiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          //bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                          informasiCuaca(heightScreen, widthScreen, 4, 7)
                        ]),
                      ))
                ]),
              ),
            ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/background/pineVectoreBG.jpg"),
                        fit: BoxFit.cover)),
                padding: const EdgeInsets.all(0),
                child: Stack(children: [
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: const EdgeInsets.all(0),
                        height: screenSize.height / 2,
                        width: double.infinity,
                        child: Column(children: [
                          topInfo(heightScreen, widthScreen, 8),
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            margin: const EdgeInsets.only(bottom: 8),
                            height: 30,
                            alignment: Alignment.topLeft,
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom:
                                BorderSide(width: 0.8, color: Colors.black),
                              ),
                            ),
                            child: const Text("Prakiraan Cuaca",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold)),
                          ),
                          //bottomInfo(heightScreen, widthScreen, perkiraanCuaca),
                          informasiCuaca(heightScreen, widthScreen, 8, 11)
                        ]),
                      ))
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

