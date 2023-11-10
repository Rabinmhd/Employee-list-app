import 'package:employee_list_app/pages/employ_add_page.dart';
import 'package:employee_list_app/pages/provider/employee_provider.dart';

import 'package:employee_list_app/widgets/current_employee.dart';
import 'package:employee_list_app/widgets/prev_employee.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

// ignore: must_be_immutable
class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(
      builder: (context, value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF1DA1F2),
            title: Text(
              "Employee List",
              style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
          body: value.employeeListCurr.isEmpty && value.employeeListPrev.isEmpty
              ? Center(
                  child: SizedBox(
                    height: 250,
                    width: 262,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Positioned(
                          top: 83,
                          left: 139,
                          child: Image.asset("assets/blastlarge.png"),
                        ),
                        Positioned(
                          right: 160,
                          top: 62,
                          bottom: 40,
                          child: Stack(
                            children: [
                              Image.asset("assets/blastmedium.png"),
                              Positioned(
                                  left: 20,
                                  child: Image.asset("assets/lens.png")),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 0,
                          left: 121,
                          right: 72,
                          child: Image.asset("assets/blastsmall.png"),
                        ),
                        Positioned(
                          top: 150,
                          left: 10,
                          child: Image.asset("assets/exclamation1.png"),
                        ),
                        Positioned(
                          top: 20,
                          left: 70,
                          child: Image.asset("assets/exclamation2.png"),
                        ),
                        Positioned(
                          top: 40,
                          right: 30,
                          child: Image.asset("assets/exclamation3.png"),
                        ),
                        Positioned(
                          child: Image.asset("assets/character.png"),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Text(
                            "No employee record found",
                            style: GoogleFonts.roboto(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Column(
                  children: [
                    Container(
                      height: 56,
                      width: double.infinity,
                      color: const Color(0xFFE5E5E5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Current employee",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1DA1F2),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(),
                          itemBuilder: (context, index) {
                            return ListTileEmployeeCurr(
                              name: value.employeeListCurr[index].name,
                              role: value.employeeListCurr[index].role,
                              fromDate: value.employeeListCurr[index].fromDate,
                            );
                          },
                          itemCount: value.employeeListCurr.length,
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: double.infinity,
                      color: const Color(0xFFE5E5E5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Previou employee",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF1DA1F2),
                            )),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) => ListTileEmployeePrv(
                            name: value.employeeListPrev[index].name,
                            role: value.employeeListPrev[index].role,
                            fromDate: value.employeeListPrev[index].fromDate,
                            toDate: value.employeeListPrev[index].toDate,
                          ),
                          itemCount: value.employeeListPrev.length,
                        ),
                      ),
                    ),
                    Container(
                      height: 56,
                      width: double.infinity,
                      color: const Color(0xFFE5E5E5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text("Swipe left to delete",
                            style: GoogleFonts.roboto(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color(0xFF949C9E),
                            )),
                      ),
                    ),
                  ],
                ),
          floatingActionButton: FloatingActionButton(
            child: const Center(
              child: Icon(Icons.add),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EmployeeAddPage(),
                  ));
            },
          ),
        );
      },
    );
  }
}
