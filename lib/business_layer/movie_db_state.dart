part of 'movie_db_cubit.dart';

@immutable
abstract class MovieDbState {}

class MovieDbInitial extends MovieDbState {}
class ModelsLoaded extends MovieDbState{
  final List<Models> models;
  ModelsLoaded(this.models);

}
