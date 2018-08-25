import 'package:flutter/material.dart';
import '../model/Noticia.dart';

class NewsCard extends StatefulWidget{
  NewsCard(this.noticia);
  final Noticia noticia;
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
              Image.network(widget.noticia.imagenUrl),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: new BoxDecoration(
                  color: Color.fromRGBO(0, 0, 0, 0.7),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Column(
                    children: <Widget>[
                      new Text(widget.noticia.titulo,
                      style: new TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: Theme.of(context).textTheme.title.fontSize
                      ),
                      ),
                      new Text(widget.noticia.descripcion.length >= 100 ? widget.noticia.descripcion.substring(0,100) : widget.noticia.descripcion,
                        style: new TextStyle(
                            color: Colors.white
                        ),
                      )
                    ],
                  ),
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
                    print('url de noticia: ${widget.noticia.urlNoticia}');
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