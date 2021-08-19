import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Avatar Page"),
        actions: <Widget>[
          Container(
            padding: EdgeInsets.all(2.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://www.pasionfutbol.com/__export/1508892277361/sites/pasionlibertadores/img/2017/10/24/ronaldinhosonri3col.jpg_423682103.jpg'),
              radius: 25.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              child: Text("BB"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage('assets/original.gif'),
          image: NetworkImage(
              'https://www.infobae.com/new-resizer/wkTnJfBCf9A3JLTSZFxbv1nGz1E=/750x0/filters:quality(100)/arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/2DS7ALG3RRC4PK5WNTXZ4HMFVA.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
          fadeOutDuration: Duration(milliseconds: 300),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
