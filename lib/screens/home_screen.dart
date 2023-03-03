import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/provider/movies_provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    if (kDebugMode) {
      print(moviesProvider.onDisplayMovies);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('En cartelera'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // tarjetas principales
            CardSwiper(movies: moviesProvider.onDisplayMovies),

            // slider de peliculas
            MovieSlider(
              movies: moviesProvider.popularMovies,
              title: 'Populares',
            ),
          ],
        ),
      ),
    );
  }
}
