

import 'package:flutter/material.dart';

import 'package:peliculas2/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget {
  //
  final List<Pelicula> peliculas;
  final Function siguientePaguina;
  //
  MovieHorizontal({ @required this.peliculas, @required this.siguientePaguina });
  //
  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.3
  );
  //
  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if ( _pageController.position.pixels >= _pageController.position.maxScrollExtent - 200 ) {
        siguientePaguina(); ///[getPopulares] se agrega al flujo
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        controller: _pageController,
        pageSnapping: false,
        // children: _targetas(context),
        itemCount: peliculas.length,
        itemBuilder: (context, i) => _targeta(context, peliculas[i]),
      ),
    );
  }

  Widget _targeta(BuildContext context, Pelicula pelicula) {

    pelicula.uniqueId = '${pelicula.id}-poster';

    final targeta = Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 130.0,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );

    return GestureDetector(
      child: targeta,
      onTap: () {
        Navigator.pushNamed(context, 'detalle', arguments: pelicula);
      },
    );
  }

  List<Widget> _targetas(BuildContext context) {
    return peliculas.map((pelicula) {
      return Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(pelicula.getPosterImg()),
                placeholder: AssetImage('assets/img/no-image.jpg'),
                fit: BoxFit.cover,
                height: 130.0,
              ),
            ),
            SizedBox(height: 5.0),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.caption,
            )
          ],
        ),
      );
    }).toList();
  }
}