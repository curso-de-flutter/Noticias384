import 'package:flutter/material.dart';

class NewsCard extends StatefulWidget{
  NewsCard({
    this.titulo, this.descripcion,
    this.imagenURL, this.urlNoticia
  });
  final String titulo;
  final String descripcion;
  final String imagenURL;
  final String urlNoticia;
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
              Image.network(widget.imagenURL != null ? widget.imagenURL : ' '),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: new Column(
                  children: <Widget>[
                    new Text(widget.titulo != null ? widget.titulo :' ',
                    style: new TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: Theme.of(context).textTheme.title.fontSize
                    ),
                    ),
                    new Text(widget.descripcion != null ? widget.descripcion : ' ',
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
                  onPressed: (){
                    print('url noticia: ${widget.urlNoticia}');
                  },
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