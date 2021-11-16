import 'package:dio/dio.dart';
import 'package:movies_app/app/models/popular.persons.dart';

class PersonRepository {
  final Dio dio;

  PersonRepository({required this.dio});

  Future<PopularPersons> getPopularPersons() async {
    final response = await dio.get('person/popular');
    final popularPersons = PopularPersons.fromJson(response.data);
    return popularPersons;
  }
  
}
