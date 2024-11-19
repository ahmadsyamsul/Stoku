import 'package:flutter/material.dart';
import 'stokmasukage.dart';
import 'auditpage.dart';
import 'pembelipage.dart';
import 'staffpage.dart';
import 'stokkeluarpage.dart';
import 'vendorpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Heqven',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Heqven'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Bagian "Data hari ini"
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Data hari ini',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DataColumn('Stok Masuk', '*', Colors.green),
                        DataColumn('Stok Keluar', '*', Colors.red),
                        DataColumn('Omset', '*', Colors.blue),
                        DataColumn('Untung', '*', Colors.purple),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
            // Tombol Laporan Stok dan Keuangan
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.assignment),
                  label: Text('Laporan Stok'),
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.bar_chart),
                  label: Text('Laporan Keuangan'),
                ),
              ],
            ),
            SizedBox(height: 20),
            // Pesan versi gratis
            // Container(
            //   padding: EdgeInsets.all(8),
            //   color: Colors.red[100],
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       Text(
            //         'Anda memakai versi gratis',
            //         style: TextStyle(color: Colors.red),
            //       ),
            //       Icon(Icons.arrow_forward, color: Colors.red),
            //     ],
            //   ),
            // ),
            SizedBox(height: 20),
            // Menu bawah: Stok Masuk, Stok Keluar, Audit, dll.
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: [
                  MenuButton('Stok Masuk', Icons.download, Colors.green, onTap: () {
                    // Aksi untuk Stok Masuk
                    // Misalnya, navigasi ke halaman Stok Masuk
                     Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StokMasukPage()),
                    );
                  }),
                  MenuButton('Stok Keluar', Icons.upload, Colors.red, onTap: () {
                    // Aksi untuk Stok Keluar
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StokKeluarPage()),
                    );
                  }),
                  MenuButton('Audit', Icons.check, Colors.orange, onTap: () {
                    // Aksi untuk Audit
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AuditPage()),
                    );
                  }),
                  MenuButton('Staff', Icons.person, Colors.purple, onTap: () {
                    // Aksi untuk Staff
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => StaffPage()),
                    );
                  }),
                  MenuButton('Vendor', Icons.local_shipping, Colors.blue, onTap: () {
                    // Aksi untuk Vendor
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => VendorPage()),
                    );
                  }),
                  MenuButton('Pembeli', Icons.group, Colors.indigo, onTap: () {
                    // Aksi untuk Pembeli
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PembeliPage()),
                    );
                  }),
                ],
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.black,),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory, color: Colors.black,),
            label: 'Barang',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.black,),
            label: 'Riwayat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.black,),
            label: 'Lainnya',
          ),
        ],
      ),
    );
  }
}

class DataColumn extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const DataColumn(this.label, this.value, this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(fontSize: 20, color: color, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final Color color;
  final VoidCallback onTap; // Menggunakan VoidCallback

  const MenuButton(this.label, this.icon, this.color, {super.key, required this.onTap}); // Pastikan onTap adalah parameter yang wajib

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Jalankan onTap saat tombol ditekan
      child: Container(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: color, size: 40),
            SizedBox(height: 10),
            Text(label, style: TextStyle(color: color, fontSize: 16)),
          ],
        ),
      ),
    );
  }
}

