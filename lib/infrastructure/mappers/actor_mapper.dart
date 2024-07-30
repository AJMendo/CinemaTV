
import 'package:cinematv/domain/entities/actor.dart';
import 'package:cinematv/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {

  static Actor castToEntity( Cast cast ) => Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${ cast.profilePath }'
    : 'https://thumbs.dreamstime.com/z/profile-icon-modern-online-line-189417382.jpg?w=768', 
    character: cast.character,
  );
}