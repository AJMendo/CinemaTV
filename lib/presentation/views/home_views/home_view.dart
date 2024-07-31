import 'package:cinematv/presentation/providers/providers.dart';
import 'package:cinematv/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {

  @override
  void initState() {
    super.initState();
    ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage();
    ref.read( popularMoviesProvider.notifier ).loadNextPage();
    ref.read( upcomingMoviesProvider.notifier ).loadNextPage();
    ref.read( topRatedMoviesProvider.notifier ).loadNextPage();

  }
  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if ( initialLoading ) return const FullScreenLoader();

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch( upcomingMoviesProvider );
    final topRatedMovies = ref.watch( topRatedMoviesProvider );

    return Visibility(
      visible: !initialLoading,
      replacement: const FullScreenLoader(),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
      
          const SliverAppBar(
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: CustomAppbar(),
              titlePadding: EdgeInsets.zero,
              
            ),
          ),
      
      
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
              
                  //const CustomAppbar(),
              
                  MoviesSlideshow(movies: slideShowMovies),
              
                  MovieHorizontalListview(
                    movies: nowPlayingMovies,
                    title: 'En cines',
                    subTitle: 'Lunes 20',
                    loadNextPage: () =>ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  MovieHorizontalListview(
                    movies: upcomingMovies,
                    title: 'Próximamente',
                    loadNextPage: () =>ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  MovieHorizontalListview(
                    movies: popularMovies,
                    title: 'Populares',
                    loadNextPage: () =>ref.read(popularMoviesProvider.notifier).loadNextPage(),
                  ),
              
                  MovieHorizontalListview(
                    movies: topRatedMovies,
                    title: 'Mejor calificadas',
                    loadNextPage: () =>ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
                  ),
        
                  const SizedBox(height: 10),
                  
                ],
              );
            },
            childCount: 1,
          )),
        ]
      ),
    );
  }
}