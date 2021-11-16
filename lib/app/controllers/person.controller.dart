import 'package:movies_app/app/models/popular.persons.dart';
import 'package:movies_app/app/repositories/person.repository.dart';

class PersonController {
  final PersonRepository personRepository;

  PersonController({required this.personRepository});

  Future<PopularPersons> getPopularPersons() async {
    final popularPersons = await personRepository.getPopularPersons();
    return popularPersons;
  }
}
