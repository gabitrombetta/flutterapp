import 'package:flutter/material.dart';
import 'package:flutterapp/components/menu.dart';
import 'package:flutterapp/models/movie_model.dart';
import 'package:flutterapp/repositories/movie_repository.dart';

class MoviePage extends StatefulWidget {
  const MoviePage({super.key});

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  late Future<List<MovieModel>> movieList;

  @override
  void initState() {
    super.initState();
    movieList = MovieRepository().getMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de filmes"),
      ),
      drawer: const Menu(),
      body: FutureBuilder(
        future: movieList,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return const Center(
              child: Text("Problema ao carregar filmes"),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text("Nenhum filme"),
            );
          }
          return buildListViewMovies(snapshot.data);
        }),
    );
  }

  Widget buildListViewMovies(movieList) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.6,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: movieList.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Image.network("https://image.tmdb.org/t/p/w500/${movieList[index].posterpath}",
              fit: BoxFit.cover,
              )
            ),
            const SizedBox(height: 4),
            Text(
              movieList[index].title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
            ),
          ]
        );
      }
    );
  }
}