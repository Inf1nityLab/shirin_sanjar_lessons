

import 'package:hive/hive.dart';
import 'package:shirin_sanjar_lessons/profile/model/person_model.dart';

class Service{
  // Создаем хранилище
  final String name = 'Person';
  final String product = 'product';
  Future<Box<PersonModel>> get _person async => await Hive.openBox<PersonModel>(name);
  Future<Box<PersonModel>> get _products async => await Hive.openBox<PersonModel>(product);

  // Create
Future<void> create(PersonModel personModel) async{
  var person = await _person;
  await person.add(personModel);
}

//read
Future<List<PersonModel>> getData() async{
  var person = await _person;
  return person.values.toList();
}


}