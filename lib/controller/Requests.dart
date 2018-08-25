import 'dart:async';
import 'dart:convert';
import '../model/Noticia.dart';
import 'package:http/http.dart' as http;

class Requests{

  static Future<List<Noticia>> petiionNoticias() async{
    var respuesta = await http.get('https://newsapi.org/v2/top-headlines?language=es&apiKey=ff0f32791a5c466ebbfc382378fc5746');

    if (respuesta.statusCode == 200){
      var jsonRespuesta = json.decode(respuesta.body);

      print('Respuesta json');
      print(jsonRespuesta);
      var listaNoticias = Noticia.fromJson(jsonRespuesta['articles']);
      return listaNoticias;
    }

    List<Noticia> no = [];
    return no;
  }
}