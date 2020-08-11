import 'dart:convert';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:flutter/material.dart';
import './DetailsPage.dart';
import 'package:http/http.dart' as http;

class Science extends StatefulWidget {
  @override
  _ScienceState createState() => _ScienceState( );
}

class _ScienceState extends State<Science> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState( );
    fetch_data_from_api( );
  }

  List data;

  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=science&apiKey=960f1b02257240a198f741b7784134b1' );
    var fetchdata = jsonDecode( jsondata.body );
    setState( () {
      data = fetchdata['articles'];
    } );
    return 'SUCCESS';
  }

  String urlimg = "https://pvsmt99345.i.lithium.com/t5/image/serverpage/image-id/10546i3DAC5A5993C8BC8C?v=1.0";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'SCIENCE FEEDS' ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: FutureBuilder(
          future: fetch_data_from_api( ),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Center(
                child: CollectionScaleTransition(

                  children: <Widget>[
                    Icon(
                      Icons.fiber_manual_record,
                      color: Theme.of(context).primaryColor,

                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      color: Theme.of(context).primaryColor,

                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      color: Theme.of(context).primaryColor,

                    ),
                    Icon(
                      Icons.fiber_manual_record,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              );
            }
            else {
              return ListView.builder(
                itemCount: data == null ? 0 : data.length,
                itemBuilder: (context, index) {
                  return (data[index]['urlToImage'] == null ||
                      data[index]['title'] == null) ? Container( ) : InkWell(
                    onTap: () {
                      Navigator.push( context, MaterialPageRoute(
                          builder: (context) =>
                              DetailsPage(
                                  data[index]['author'] =
                                  data[index]['author'] == null
                                      ? ''
                                      : data[index]['author'],
                                  data[index]['urlToImage'] =
                                  data[index]['urlToImage'] == null
                                      ? ''
                                      : data[index]['urlToImage'],
                                  data[index]['title'] =
                                  data[index]['title'] == null
                                      ? ''
                                      : data[index]['title'],
                                  data[index]['description'] =
                                  data[index]['description'] == null
                                      ? ''
                                      : data[index]['description'],
                                  data[index]['publishedAt'] =
                                  data[index]['publishedAt'] == null
                                      ? ''
                                      : data[index]['publishedAt'],
                                  data[index]['url'] =
                                  data[index]['url'] == null
                                      ? ''
                                      : data[index]['url']
                              )
                      ) );
                    },
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Container(
                        padding: EdgeInsets.all( 10.0 ),
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                                borderRadius: BorderRadius.circular( 8.0 ),
                                child: Image.network(
                                    data[index]['urlToImage'] ) ),
                            Text(
                              data[index]['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              //height: 10.0,
                              thickness: 2.0,
                              color: Colors.grey,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
