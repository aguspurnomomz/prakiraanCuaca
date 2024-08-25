import 'package:aplikasi_cuaca/view/fragmentCuaca.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:xml2json/xml2json.dart';

import 'dart:async';
import 'dart:convert';

class Dashboard extends StatefulWidget {
  const Dashboard({Key key,this.judul });
  final String judul;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  String textSearch = '';
  StreamController streamDataBMKG;


  Future<List<dynamic>> dataProvJabar() async {
    var apiURL = "https://data.bmkg.go.id/DataMKG/MEWS/DigitalForecast/DigitalForecast-JawaTengah.xml";
    final result = await http.get(Uri.parse(apiURL));
    final Xml2Json xml2Json = Xml2Json();
    xml2Json.parse(result.body);
    var json = xml2Json.toGData();

    Map<String, dynamic> map = jsonDecode(json);
    return map['data']['forecast']['area'];
  }

  Widget buildListKota(item) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: ((context) => fragmentCuaca(
                judul: item['description'],
                header : item['name'],
                data: item['parameter']))));
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        elevation: 15,
          child: ListTile(
            title: Text(
              item['description'],
                style: TextStyle(fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold)
            ),
            subtitle: Text(item['name'][1]['\$t'].toString()),
          )),
    );
  }

  @override
  void initState() {
    super.initState();// Set nilai default
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.judul,
            style: const TextStyle(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background/mountainvectoreBG.jpg'),
              fit: BoxFit.cover,
            ),
          ),

          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                height: 20,
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(width: 0.8, color: Colors.white),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder<List<dynamic>>(
                  future: dataProvJabar(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }

                    if (snapshot.hasData) {
                      List<dynamic> dataKota = snapshot.data;
                      if (textSearch.isNotEmpty) {
                        dataKota = dataKota.where((element) {
                          return element['description']
                              .toString()
                              .toLowerCase()
                              .contains(textSearch.toString().toLowerCase());
                        }).toList();
                      }
                      return ListView.builder(
                          padding: const EdgeInsets.all(10),
                          itemCount: dataKota.length,
                          itemBuilder: (BuildContext context, int index) {
                            var item = dataKota[index];
                            return buildListKota(item);
                          });
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
