import 'dart:async';
import 'dart:convert';
import '../model/Noticia.dart';
import 'package:http/http.dart' as http;

class Requests{

  static Future<List<Noticia>> petiionNoticias(recurso) async{
    var url = 'https://newsapi.org/v2/top-headlines?language=es&apiKey=ff0f32791a5c466ebbfc382378fc5746';
    if(recurso != null){
      url = 'https://newsapi.org/v2/top-headlines?language=es&sources=$recurso&apiKey=ff0f32791a5c466ebbfc382378fc5746';
    }
    var respuesta = await http.get(url);

    if (respuesta.statusCode == 200){
      var jsonRespuesta = json.decode(respuesta.body);

//      print('Respuesta json');
//      print(jsonRespuesta);
      var listaNoticias = Noticia.fromJson(jsonRespuesta['articles']);
      return listaNoticias;
    }

    List<Noticia> no = [];
    return no;
  }
  static Future<List<dynamic>> peticionRecursos() async{
    var respuesta = await http.get('https://newsapi.org/v2/sources?language=es&apiKey=ff0f32791a5c466ebbfc382378fc5746');

    if (respuesta.statusCode == 200){
      var jsonRespuesta = json.decode(respuesta.body);

//      print('Respuesta json');
//      print(jsonRespuesta['sources']);
      List<dynamic> listaRecursos = [];

      for (var i = 0; i < jsonRespuesta['sources'].length; i++){
//        print(i.toString());
        listaRecursos.add(
            {
              'id' : jsonRespuesta['sources'][i]['id'],
              'name': jsonRespuesta['sources'][i]['name']
            }
        );
      }
      return listaRecursos;
    }

    List<dynamic> no = [];
    return no;
  }
}