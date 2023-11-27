import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  const Category({super.key});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  bool isPengeluaran = true;

  void openMenu() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      (isPengeluaran)
                          ? "Tambahkan Pendapatan"
                          : "Tambahkan Pengeluaran",
                      style: GoogleFonts.montserrat(
                          fontSize: 18,
                          color: (isPengeluaran) ? Colors.blue : Colors.red),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusColor: Colors.blue,
                          hintText: "Nama"),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(onPressed: () {}, child: Text("Simpan"))
                  ],
                ),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Switch(
                value: isPengeluaran,
                onChanged: (bool value) {
                  setState(() {
                    isPengeluaran = value;
                  });
                },
                activeColor: Colors.blue,
                inactiveTrackColor: Colors.red[200],
                inactiveThumbColor: Colors.red,
              ),
              Text(
                  isPengeluaran ? 'Pendapatan' : 'Pengeluaran',
                  style: GoogleFonts.montserrat(
                      fontSize: 18,
                      color: (isPengeluaran) ? Colors.blue : Colors.red),
                ),
              IconButton(
                  onPressed: () {
                    openMenu();
                  },
                  icon: Icon(Icons.add))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isPengeluaran)
                  ? Icon(
                      Icons.download,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.upload,
                      color: Colors.red,
                    ),
              title: Text("Bensin"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Card(
            elevation: 10,
            child: ListTile(
              leading: (isPengeluaran)
                  ? Icon(
                      Icons.download,
                      color: Colors.blue,
                    )
                  : Icon(
                      Icons.upload,
                      color: Colors.red,
                    ),
              title: Text("Makan"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                  SizedBox(
                    width: 10,
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.edit))
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
