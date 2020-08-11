import 'package:flutter/material.dart';
import './ImageView.dart';
class DetailsPage extends StatefulWidget {
  String author, image, title, description, date, url;

  DetailsPage(this.author, this.image, this.title, this.description, this.date,
      this.url);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FEEDS"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Stack(
          children: <Widget>[
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ImageView(widget.image)));
              },
              child: Image.network(widget.image,
                  fit: BoxFit.cover,
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 250, 0, 0),
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Material(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          widget.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          widget.description,
                          style: TextStyle(
                            fontSize: 18,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                      Text(
                        widget.author,
                        style: TextStyle(
                          fontSize: 10,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
