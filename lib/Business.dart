import 'dart:convert';
import './DetailsPage.dart';
import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:http/http.dart' as http;

class Business extends StatefulWidget {
  @override
  _BusinessState createState() => _BusinessState( );
}

class _BusinessState extends State<Business> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState( );
    fetch_data_from_api( );
  }

  List data;

  Future<String> fetch_data_from_api() async {
    var jsondata = await http.get(
        'http://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=960f1b02257240a198f741b7784134b1' );
    var fetchdata = jsonDecode( jsondata.body );
    setState( () {
      data = fetchdata['articles'];
    } );
    return 'SUCCESS';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( 'BUSINESS FEEDS' ),
      ),
      body: Container(
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
