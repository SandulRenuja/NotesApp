import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 2)
class Todo{

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String titel;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final DateTime time;

  @HiveField(4)
  final bool isDone;

  Todo({
    String? id, 
    required this.titel, 
    required this.date, 
    required this.time,
    required this.isDone,
  }): id =id ?? Uuid().v4();
}