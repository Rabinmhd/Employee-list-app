import 'package:flutter/material.dart';

Future<DateTime?> showDatePickTo(BuildContext context) async {
  return showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
    //builder: (context, child) {},
  );
}
