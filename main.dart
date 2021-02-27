import 'package:flutter/material.dart';
//
import 'package:peliculas2/src/pages/home_page.dart';
import 'package:peliculas2/src/pages/pelicula_detalle.dart';
main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App Peliculas',
      initialRoute: '/',
      routes: {
        '/'       : ( BuildContext ccntext ) => HomePage(),
        'detalle' : ( BuildContext context ) => PeliculaDetalle()
      },
    );
  }
}
