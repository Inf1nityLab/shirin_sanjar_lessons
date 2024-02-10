
import 'package:hive/hive.dart';
part 'person_model.g.dart';

@HiveType(typeId: 1)
class PersonModel{
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String age;

  PersonModel(this.name, this.age);
}