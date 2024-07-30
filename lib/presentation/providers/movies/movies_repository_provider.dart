

import 'package:cinematv/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinematv/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl( MoviedbDataSource() );
});