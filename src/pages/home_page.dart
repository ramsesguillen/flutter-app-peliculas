import 'package:flutter/material.dart';
//
import 'package:peliculas2/src/search/search_delegate.dart';
import 'package:peliculas2/src/widgets/card_seiper_widget.dart';
import 'package:peliculas2/src/providers/peliculas_provider.dart';
import 'package:peliculas2/src/widgets/movie_horizontal.dart';
//

class HomePage extends StatelessWidget {
  //
  final peliculasProvide = new PeliculaProviders();
  //
  @override
  Widget build(BuildContext context) {

///[getPopulares] se agrega al flijo
///
    peliculasProvide.getPopulares();

    return Scaffold(
      // body: SafeArea(child: Text('hola')),
      appBar: AppBar(
        centerTitle: false,
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search),
            onPressed: (){
              showSearch(
                context: context,
                delegate: DataSearch(),
                //  query: 'Texto por defecto'
              );
            }
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            _swiperTargetas(),
            _footer(context),
          ],
        ),
      ),
    );
  }


  Widget _swiperTargetas() {
    return FutureBuilder(
      future: peliculasProvide.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

        if ( snapshot.hasData ) {
          return CardSwiper(
            peliculas: snapshot.data,
          );
        } else {
          return Container(
            height: 400.0,
            child: Center(
              child: CircularProgressIndicator()
            )
          );
        }

      },
    );
  }


  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text('Populares', style: Theme.of(context).textTheme.subhead )
          ),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvide.popularesStrem,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {

              if ( snapshot.hasData )
                return MovieHorizontal(
                  peliculas: snapshot.data,
                  siguientePaguina: peliculasProvide.getPopulares, ///agregar al flujo
                );
              else
                return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
