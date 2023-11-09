import 'package:hive/hive.dart';
part 'model_previous.g.dart';

@HiveType(typeId: 2)
class EmployeeModelPrevious {
  @HiveField(0)
  String name;
  @HiveField(1)
  String role;
  @HiveField(2)
  String fromDate;
  @HiveField(3)
  String toDate;
  EmployeeModelPrevious({
    required this.name,
    required this.role,
    required this.fromDate,
    required this.toDate,
  });
}
