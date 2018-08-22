import 'package:flutter/material.dart';
import 'NewsCard.dart';

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
      body: NewsCard(),
    );
  }
}