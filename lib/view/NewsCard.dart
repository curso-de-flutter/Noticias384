import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget{

  @override
  State createState() => _NewsCard();
}

class _NewsCard extends State<NewsCard>{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: <Widget>[
          Stack(
            alignment: Alignment(0.0, 1.0),
            children: <Widget>[
              Image.network('http://a57.foxnews.com/media2.foxnews.com/BrightCove/694940094001/2018/08/21/0/0/694940094001_5825037545001_5825036631001-vs.jpg'),
              Container(
                child: Column(
                  children: <Widget>[
                    Text('Titulo',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.title.fontSize
                    ),
                    ),
                    Text('Descripcion de la noticia',
                      style: new TextStyle(
                          color: Colors.white
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Text('TARJETA'),
        ],
      ),
    );
  }

}