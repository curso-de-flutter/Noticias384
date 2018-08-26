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
  var _recursos = [];
  var _recursoSeleccionado;
  final GlobalKey<AsyncLoaderState> _asyncLoaderState =
      new GlobalKey<AsyncLoaderState>();

  getMessage() async{
    return new Future.delayed(Duration(seconds: 5), ()=> 'Cargado correctamente');
  }

  obteniendoDatosImporantes() async{
    var recursos = await Requests.peticionRecursos();
//    print('recursosos: '+recursos.toString());
    recursos.add({
      'id': 'todos',
      'name': 'Todos'
    });
    setState(() {
      _recursos = recursos;
    });
    return await Requests.petiionNoticias(_recursoSeleccionado);
  }

  @override
  Widget build(BuildContext context) {

    var _asynLoader = new AsyncLoader(
      key: _asyncLoaderState,
      initState: () async => await obteniendoDatosImporantes(),
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
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (seleccion){
              print('selecicon: $seleccion');
              if (seleccion == 'todos'){
                setState(() {
                  _recursoSeleccionado = null;
                });
              }else{
                setState(() {
                  _recursoSeleccionado = seleccion;
                });
              }

              _asyncLoaderState.currentState.reloadState();
            },
            itemBuilder: (BuildContext contex){
              return _recursos.map((objeto){
                return PopupMenuItem(
                  value: objeto['id'],
                    child: Text(objeto['name']),
                );
              }).toList();
            },
          )
        ],
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