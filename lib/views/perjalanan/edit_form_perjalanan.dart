import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_healthcare/components/header_sub.dart';
import 'package:travel_healthcare/controller/travelhistory_controller.dart';
import 'package:travel_healthcare/controller/travelscore_controller.dart';
import 'package:travel_healthcare/model/travelhistory_model.dart';
import 'package:travel_healthcare/model/travelscore_model.dart';

class UpdateFormPerjalanan extends StatefulWidget {
  const UpdateFormPerjalanan(
      {super.key,
      this.kotaTujuan,
      this.provinsiTujuan,
      this.durasiTravel,
      this.tujuanTravel,
      this.id,
      this.formattgl,
      this.durasiTravelbobot,
      this.tujuanTravelbobot,
      this.provinsiTujuanbobot});

  final int? id;
  final String? kotaTujuan;
  final String? provinsiTujuan;
  final String? formattgl;
  final String? durasiTravel;
  final String? tujuanTravel;
  final int? provinsiTujuanbobot;
  final int? durasiTravelbobot;
  final int? tujuanTravelbobot;

  @override
  State<UpdateFormPerjalanan> createState() => _UpdateFormPerjalananState();
}

class _UpdateFormPerjalananState extends State<UpdateFormPerjalanan> {
  final _formKey = GlobalKey<FormState>();

  final travelhistoryCtrl = TravelHistoryController();
  TravelScoreController travelScoreController = TravelScoreController();
  final TextEditingController inputtgl = TextEditingController();

  Color myColor = Color(0xFFE0F4FF);

  String? newkotaTujuan;
  String? newprovinsiTujuan;
  String? newformattgl;
  String? newdurasiTravel;
  String? newtujuanTravel;
  int? newprovinsiTujuanbobot;
  int? newdurasiTravelbobot;
  int? newtujuanTravelbobot;

  void updateTravelHistory(int id) async {
    TravelHistoryModel travelHistoryModel = TravelHistoryModel(
      kotaTujuan: newkotaTujuan!,
      provinsiTujuan: newprovinsiTujuan!,
      formattgl: inputtgl.text,
      durasiTravel: newdurasiTravel!,
      tujuanTravel: newtujuanTravel!,
    );
    await travelhistoryCtrl.updateTravelHistory(id, travelHistoryModel);
  }

  Future<void> addTravelScore() async {
    if (_formKey.currentState?.validate() ?? false) {
      TravelScoreModel travelScoreModel = TravelScoreModel(
        durasiTravelBobot: newdurasiTravelbobot!,
        tujuanTavelBobot: newtujuanTravelbobot!,
        categories: '',
        provinsiTujuanBobot: newprovinsiTujuanbobot!,
      );
      await travelScoreController.createTravelScore(travelScoreModel);

      //Navigator.pop(context, true);
    }
  }

  @override
  void initState() {
    super.initState();
    newkotaTujuan = widget.kotaTujuan;
    newprovinsiTujuan = widget.provinsiTujuan;
    inputtgl.text = widget.formattgl ?? '';
    newdurasiTravel = widget.durasiTravel;
    newtujuanTravel = widget.tujuanTravel;
    newprovinsiTujuanbobot = widget.provinsiTujuanbobot;
    newdurasiTravelbobot = widget.durasiTravelbobot ?? 0;
    newtujuanTravelbobot = widget.tujuanTravelbobot ?? 0;
  }

  List<String> daftarProvinsi = [
    'Aceh',
    'Sumatera Utara',
    'Sumatera Barat',
    'Riau',
    'Kepulauan Riau',
    'Jambi',
    'Sumatera Selatan',
    'Bengkulu',
    'Lampung',
    'Bangka Belitung',
    'DKI Jakarta',
    'Jawa Barat',
    'Banten',
    'Jawa Tengah',
    'DI Yogyakarta',
    'Jawa Timur',
    'Bali',
    'Nusa Tenggara Barat',
    'Nusa Tenggara Timur',
    'Kalimantan Barat',
    'Kalimantan Tengah',
    'Kalimantan Selatan',
    'Kalimantan Timur',
    'Kalimantan Utara',
    'Gorontalo',
    'Sulawesi Barat',
    'Sulawesi Utara',
    'Sulawesi Tengah',
    'Sulawesi Selatan',
    'Sulawesi Tenggara',
    'Maluku',
    'Maluku Utara',
    'Papua Barat',
    'Papua',
  ];

  List<int> daftarprovinsibobot = [
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
    70,
  ];

  List<DropdownMenuItem> generateProvinsi(
      List<String> daftarProvinsi, List<int> daftarprovinsibobot) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < daftarProvinsi.length; i++) {
      items.add(DropdownMenuItem(
        child: Text(daftarProvinsi[i]),
        value: daftarProvinsi[i],
        onTap: () {
          // Simpan bobot yang sesuai saat opsi dipilih
          setState(() {
            newprovinsiTujuan = daftarProvinsi[i];
            newprovinsiTujuanbobot = daftarprovinsibobot[i];
          });
        },
      ));
    }
    return items;
  }

  List<String> daftarDurasi = [
    '1 - 7 hari',
    '8 - 30 hari',
    '31 hari hingga 6 bulan',
    'lebih dari 6 bulan'
  ];

  List<int> daftarDurasibobot = [0, 5, 10, 20];

  List<DropdownMenuItem> generateDurasi(
      List<String> daftarDurasi, List<int> daftarDurasibobot) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < daftarDurasi.length; i++) {
      items.add(DropdownMenuItem(
        child: Text(daftarDurasi[i]),
        value: daftarDurasi[i],
        onTap: () {
          // Simpan bobot yang sesuai saat opsi dipilih
          setState(() {
            newdurasiTravel = daftarDurasi[i];
            newdurasiTravelbobot = daftarDurasibobot[i];
          });
        },
      ));
    }
    return items;
  }

  List<String> daftarTujuan = [
    'Belajar di luar daerah',
    'Backpaker',
    'Perjalanan untuk pekerjaan',
    'Mengunjungi teman dan kerabat',
    'Liburan',
    'Berpergian ke luar daerah',
    'Safari',
    'Kegiatan olahraga',
    'Pelayaran'
        'Kerja sukarela',
    'Daerah pegunungan tinggi',
    'Ziarah',
    'lainnya'
  ];

  List<int> daftarTujuanbobot = [5, 20, 5, 10, 0, 10, 5, 10, 20, 20, 5, 10, 5];

  List<DropdownMenuItem> generateTujuan(
      List<String> daftarTujuan, List<int> daftarTujuanbobot) {
    List<DropdownMenuItem> items = [];
    for (var i = 0; i < daftarTujuan.length; i++) {
      items.add(DropdownMenuItem(
        child: Text(daftarTujuan[i]),
        value: daftarTujuan[i],
        onTap: () {
          // Simpan bobot yang sesuai saat opsi dipilih
          setState(() {
            newtujuanTravel = daftarTujuan[i];
            newtujuanTravelbobot = daftarTujuanbobot[i];
          });
        },
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HeaderSub(context, titleText: 'Edit Form'),
      backgroundColor: myColor,
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Nama Kota Tujuan :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    // controller: _kotaTujuan,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors
                          .white, // Set the background color to light blue
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 0), // Set border color
                      ),
                    ),
                    onSaved: (value) {
                      newkotaTujuan = value;
                    },
                    initialValue: widget.kotaTujuan,
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Provinsi Tujuan :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 130),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    dropdownColor: myColor,
                    value: newprovinsiTujuan,
                    items:
                        generateProvinsi(daftarProvinsi, daftarprovinsibobot),
                    onChanged: (item) {
                      setState(() {
                        newprovinsiTujuan = item;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tanggal Keberangkatan:',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: inputtgl,
                    decoration: InputDecoration(
                      hintText: 'Piliha tanggal keberangkatan anda',
                      suffixIcon: const Icon(Icons.event),
                      filled: true,
                      fillColor: Colors.white,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 0),
                      ),
                    ),
                    readOnly: true,
                    onTap: () async {
                      DateTime? picktanggal = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );

                      if (picktanggal != null) {
                        newformattgl =
                            DateFormat('dd-MM-yyyy').format(picktanggal);

                        setState(() {
                          inputtgl.text = newformattgl.toString();
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Durasi Perjalanan :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 130),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    dropdownColor: myColor,
                    value: newdurasiTravel,
                    items: generateDurasi(daftarDurasi, daftarDurasibobot),
                    onChanged: (item) {
                      setState(() {
                        newdurasiTravel = item;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 15),
                Container(
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tujuan Perjalanan :',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 10),
                  margin: const EdgeInsets.only(right: 50),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(10),
                    icon: const Icon(Icons.keyboard_arrow_down_rounded),
                    dropdownColor: myColor,
                    value: newtujuanTravel,
                    items: generateTujuan(daftarTujuan, daftarTujuanbobot),
                    onChanged: (item) {
                      setState(() {
                        newtujuanTravel = item;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 80),
                Column(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size.fromHeight(50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();

                          updateTravelHistory(widget.id!);
                          addTravelScore();

                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text(
                                      'Data Form Perjalanan berhasil diubah')));

                          Navigator.pop(context, true);
                          //Navigator.pop(context, true);
                        }
                      },
                      child: const Text("Edit"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
