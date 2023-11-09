import 'package:employee_list_app/pages/provider/employee_provider.dart';
import 'package:employee_list_app/utils/model_current.dart';
import 'package:employee_list_app/utils/model_previous.dart';
import 'package:employee_list_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class EmployeeAddPage extends StatelessWidget {
  EmployeeAddPage({super.key});

  final nameController = TextEditingController();
  ValueNotifier<String> roleNotifier = ValueNotifier("Select role");
  final dateController = TextEditingController();
  String fromDate = "Today";
  String toDate = "No date";

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(builder: (context, value, child) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFF1DA1F2),
          title: Text(
            "Add Employee Details",
            style: GoogleFonts.roboto(
                fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white),
          ),
        ),
        body: Padding(
          padding:
              const EdgeInsets.only(top: 24, right: 16, left: 16, bottom: 24),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                    color: const Color(0xffE5E5E5),
                  ),
                ),
                height: 40,
                width: 396,
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Employee name',
                    border:
                        const OutlineInputBorder(borderSide: BorderSide.none),
                    labelStyle: GoogleFonts.roboto(
                      fontSize: 16,
                      color: const Color(0xFF949C9E),
                    ),

                    prefixIcon:
                        Image.asset("assets/profile.png"), // Profile icon
                  ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SizedBox(
                        height: 260,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  roleNotifier.value = "Product designer";

                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Product designer",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              InkWell(
                                onTap: () {
                                  roleNotifier.value = "Flutter developer";
                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Flutter developer",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: const Color(0xFF949C9E),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              InkWell(
                                onTap: () {
                                  roleNotifier.value = "QA tester";
                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "QA tester",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: const Color(0xFF949C9E),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              InkWell(
                                onTap: () {
                                  roleNotifier.value = "Product owner";
                                  Navigator.pop(context);
                                },
                                child: SizedBox(
                                  height: 40,
                                  width: double.infinity,
                                  child: Center(
                                    child: Text(
                                      "Product owner",
                                      style: GoogleFonts.roboto(
                                        fontSize: 16,
                                        color: const Color(0xFF949C9E),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: const Color(0xffE5E5E5),
                    ),
                  ),
                  height: 40,
                  width: 396,
                  child: Row(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset("assets/suitcase.png"),
                    ), // Remove the border
                    ValueListenableBuilder(
                        valueListenable: roleNotifier,
                        builder: (context, value, _) {
                          return Text(
                            value,
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: Color(0xFF949C9E),
                            ),
                          );
                        }),
                  ] // Profile icon
                      ),
                ),
              ),
              const SizedBox(
                height: 23,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePickTo(context);
                      if (date != null) {
                        fromDate =
                            DateFormat('d MMMM y').format(date).toString();
                      }
                      print(fromDate);
                    },
                    child: Container(
                      height: 40,
                      width: 132,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffE5E5E5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Image.asset("assets/calender.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14,
                            ),
                            child: Text(fromDate,
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xff323238))),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(left: 5, right: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/arrow_right.png"),
                        ],
                      )),
                  InkWell(
                    onTap: () async {
                      DateTime? date = await showDatePickTo(context);
                      if (date != null) {
                        toDate = DateFormat('d MMMM y').format(date).toString();
                      }
                      print(toDate);
                    },
                    child: Container(
                      height: 40,
                      width: 132,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xffE5E5E5),
                        ),
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 4),
                            child: Image.asset("assets/calender.png"),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 14,
                            ),
                            child: Text(
                              toDate,
                              style: GoogleFonts.roboto(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  // color: const Color(0xff323238),
                                  color: const Color(0xFF949C9E)),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 73,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xFFEDF8FF)),
                            child: Center(
                                child: Text(
                              "Cancel",
                              style: GoogleFonts.roboto(
                                  fontSize: 14, color: const Color(0xFF1DA1F2)),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        InkWell(
                          onTap: () {
                            if (toDate == "No date") {
                              value.addToCurrentEmployeeList(
                                EmployeeModelCurrent(
                                  name: nameController.text,
                                  role: roleNotifier.value,
                                  fromDate: fromDate,
                                ),
                              );
                            } else {
                              value.addToPreviousEmployeeList(
                                EmployeeModelPrevious(
                                    name: nameController.text,
                                    role: roleNotifier.value,
                                    fromDate: fromDate,
                                    toDate: toDate),
                              );
                            }
                            Navigator.pop(context);
                          },
                          child: Container(
                            height: 40,
                            width: 73,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: const Color(0xFF1DA1F2)),
                            child: Center(
                              child: Text("Save",
                                  style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
