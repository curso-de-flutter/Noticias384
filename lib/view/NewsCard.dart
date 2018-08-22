import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget{
  @override
  State createState() => _NewsCard();
}

class _NewsCard extends State<NewsCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new Stack(
            alignment: Alignment(0.0, 1.0),
            children: <Widget>[
              Image.network('http://a57.foxnews.com/media2.foxnews.com/BrightCove/694940094001/2018/08/21/0/0/694940094001_5825037545001_5825036631001-vs.jpg'),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: new Column(
                  children: <Widget>[
                    new Text('Titulo',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.title.fontSize
                    ),
                    ),
                    new Text('Descripcion de la noticia',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Divider(color: Colors.black,),
          Container(
            child: Row(
              children: <Widget>[
                FlatButton(
                  onPressed: (){},
                  child: Text('Ver Noticia'),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

}