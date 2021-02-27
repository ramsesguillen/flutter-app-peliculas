///[]
class Peliculas {
  // crea una lista dinamica para alcenar objetos de tipo pelicula
  List<Pelicula> items = new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {

    if ( jsonList == null ) return;

    for (var item in jsonList) {
      // en cada ciclo se crea una instancia de pelicula pasando una map como argumento al constructor
      final pelicula = new Pelicula.fromJsonMap(item);
      // se guarda el objeto en la lista
      items.add(pelicula);
    }

  }
}


///[]
class Pelicula {

  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json ) {
    releaseDate       = json['release_date'];
    overview          = json['overview'];
    voteAverage       = json['vote_average'] / 1;
    title             = json['title'];
    genreIds          = json['genre_ids'].cast<int>();
    originalTitle     = json['original_title'];
    originalLanguage  = json['original_language'];
    backdropPath      = json['backdrop_path'];
    adult             = json['adult'];
    id                = json['id'];
    posterPath        = json['poster_path'];
    video             = json['video'];
    voteCount         = json['vote_count'];
    popularity        = json['popularity'] / 1;
  }

  String getPosterImg() {
    if (posterPath == null )
      return 'https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1350441335.jpg';
    else
      return 'https://image.tmdb.org/t/p/w500/$posterPath';
  }

  String getBackgroundImg() {
    if (posterPath == null )
      return 'https://image.shutterstock.com/image-vector/picture-vector-icon-no-image-260nw-1350441335.jpg';
    else
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
  }

}






