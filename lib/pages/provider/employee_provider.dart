import 'package:employee_list_app/utils/model_current.dart';
import 'package:employee_list_app/utils/model_previous.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

class EmployeeProvider extends ChangeNotifier {
  List<EmployeeModelPrevious> employeeListPrev = [];

  List<EmployeeModelCurrent> employeeListCurr = [];

  Future<void> addToPreviousEmployeeList(
      EmployeeModelPrevious modelPrevious) async {
    final addHivePreviousDB =
        await Hive.openBox<EmployeeModelPrevious>("previous_employee");
    addHivePreviousDB.add(modelPrevious);
    employeeListPrev.clear();
    employeeListPrev.addAll(addHivePreviousDB.values);
    // employeeListPrev.add(modelPrevious);
    //print(employeeListPrev[0].name);
    notifyListeners();
  }

  Future<void> addToCurrentEmployeeList(
      EmployeeModelCurrent modelCurrent) async {
    // employeeListCurr.add(modelCurrent);
    final addHiveCurrentDB =
        await Hive.openBox<EmployeeModelCurrent>("current_employee");
    addHiveCurrentDB.add(modelCurrent);
    employeeListCurr.clear();
    employeeListCurr.addAll(addHiveCurrentDB.values);
    //print("object");
    notifyListeners();
  }

  Future<void> getAllData() async {
    final addHiveCurrentDB =
        await Hive.openBox<EmployeeModelCurrent>("current_employee");
    employeeListCurr.clear();
    employeeListCurr.addAll(addHiveCurrentDB.values);

    final addHivePreviousDB =
        await Hive.openBox<EmployeeModelPrevious>("previous_employee");
    employeeListPrev.clear();
    employeeListPrev.addAll(addHivePreviousDB.values);
    notifyListeners();
  }
}
