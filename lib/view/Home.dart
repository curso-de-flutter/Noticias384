import 'package:flutter/material.dart';
import 'NewsCard.dart';
import '../model/Noticia.dart';
import 'dart:async';
import '../controller/Requests.dart';
import 'package:async_loader/async_loader.dart';

class Home extends StatefulWidget{

  @override
  State createState() => _HomeState();
}
class _HomeState extends State<Home>{
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  getMessage() async{
    return new Future.delayed(Duration(seconds: 5), ()=> 'Cargado correctamente');
  }
  @override
  Widget build(BuildContext context) {

    var _asynLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await Requests.petiionNoticias(),
      renderLoad: () => Center(child: CircularProgressIndicator(),),
      renderError: ([error])=> Center(child: Text('Ocurrion un error en la carga'),),
      renderSuccess: ({data}) => Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
            itemBuilder: (BuildContext context, index){
              return NewsCard(data[index]);
            },
          itemCount: data.length,
        ),
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        title: Text('Noticias384'),
      ),
      body: _asynLoader

//      new NewsCard(new Noticia(
//        titulo: 'Mi noticia',
//        descripcion: 'Descripcion de noticia',
//        imagenUrl: 'http://www.elefete.com/wp-content/uploads/2017/06/google-Copiar.jpg'
//      ))
      ,
    );
  }
}