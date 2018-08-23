import 'package:flutter/material.dart';
import 'NewsCard.dart';
import '../model/Noticia.dart';

class Home extends StatefulWidget{

  @override
  State createState() => _HomeState();
}
class _HomeState extends State<Home>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text('Noticias384'),
      ),
      body: NewsCard(new Noticia(
        titulo: 'Mi noticia',
        descripcion: 'Descripcion de noticia',
        imagenUrl: 'http://www.elefete.com/wp-content/uploads/2017/06/google-Copiar.jpg'
      )),
    );
  }
}