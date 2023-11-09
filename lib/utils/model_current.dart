import 'package:hive/hive.dart';
part 'model_current.g.dart';

@HiveType(typeId: 1)
class EmployeeModelCurrent {
  @HiveField(0)
  String name;
  @HiveField(1)
  String role;
  @HiveField(2)
  String fromDate;

  EmployeeModelCurrent({
    required this.name,
    required this.role,
    required this.fromDate,
  });
}
