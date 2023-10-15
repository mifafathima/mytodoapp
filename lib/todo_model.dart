import 'package:hive/hive.dart';
part 'todo_model.g.dart';


@HiveType(typeId: 0)
class  TodoModel{
  @HiveField(0)
  String Description;

  @HiveField(1)
  bool isDone;

  TodoModel({required this.Description,  this.isDone = false});

}