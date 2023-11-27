//import 'package:aplikasi_pencatatan_keuangan/pages/category.dart';
import 'package:flutter/material.dart';
import 'package:calendar_appbar/calendar_appbar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:budgetbuddy/pages/home.dart';
import 'package:budgetbuddy/pages/category.dart';
import 'package:budgetbuddy/pages/transaksi.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _children = [home(), Category()];
  int currentIndex = 0;
  void onTapTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (currentIndex == 0)
          ? CalendarAppBar(
              backButton: false,
              locale: 'id',
              onDateChanged: (value) => print(value),
              firstDate: DateTime.now().subtract(Duration(days: 140)),
              lastDate: DateTime.now(),
            )
          : PreferredSize(
              preferredSize: Size.fromHeight(70),
              child: Container(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 37, horizontal: 16),
                  child: Text(
                    "Kategori",
                    style: GoogleFonts.montserrat(fontSize: 21),
                  ),
                ),
              )),
      floatingActionButton: Visibility(
        visible: (currentIndex == 0) ? true : false,
        child: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(
              builder: (context) => Transaksi(),
            ))
                .then((value) {
              setState(() {});
            });
          },
          backgroundColor: Colors.blue,
          child: Icon(Icons.add),
        ),
      ),
      body: _children[currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        IconButton(
            onPressed: () {
              onTapTapped(0);
            },
            icon: Icon(Icons.home)),
        SizedBox(
          width: 20,
        ),
        IconButton(
            onPressed: () {
              onTapTapped(1);
            },
            icon: Icon(Icons.list))
      ])),
    );
  }
}
