import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Transaksi extends StatefulWidget {
  const Transaksi({super.key});

  @override
  State<Transaksi> createState() => _TransaksiState();
}

class _TransaksiState extends State<Transaksi> {
  bool isPengeluaran = true;
  //data dummy buat list dropdown
  List<String> list = ['Transportasi & Bensin', "Hiburan", "Makan & Minum"];
  late String dropDownValue = list.first;
  TextEditingController dateController = TextEditingController();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Transaksi"),
        backgroundColor: Colors.blue,
      ),
      //isi dari halaman transaksi
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: UnderlineInputBorder(), labelText: "Jumlah"),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Kategori",
                style: GoogleFonts.montserrat(fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: DropdownButton<String>(
                  value: dropDownValue,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward),
                  items: list.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? value) {}),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                readOnly: true,
                controller: dateController,
                decoration: InputDecoration(labelText: "Masukan Tanggal"),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2999));

                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat("yyy-MM-dd").format(pickedDate);

                    dateController.text = formattedDate;
                  }
                },
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Center(
                child: ElevatedButton(onPressed: () {}, child: Text("Simpan")))
                
          ],
        )),
      ),
    );
  }
}
