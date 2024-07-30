

import 'package:cinematv/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinematv/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource() );
});