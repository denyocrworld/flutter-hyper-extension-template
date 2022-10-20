import 'package:example/core.dart';
import 'package:flutter/material.dart';

extension WidgetExtension on Widget {
  Widget get scroll {
    return SingleChildScrollView(
      controller: ScrollController(),
      child: this,
    );
  }

  Widget get p20 {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: this,
    );
  }

  Widget get p8 {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: this,
    );
  }

  Widget get card {
    return Card(
      child: SizedBox(
        width: MediaQuery.of(Get.currentContext).size.width,
        child: this,
      ),
    );
  }
}

extension StringExtension on String {
  getText(double size) {
    return Text(
      this,
      style: TextStyle(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget get h1 => getText(30);
  Widget get h2 => getText(24);
  Widget get h3 => getText(20);
  Widget get h4 => getText(18);
  Widget get h5 => getText(16);
  Widget get h6 => getText(14);

  Widget get statistic {
    return Expanded(
      child: Container(
        width: MediaQuery.of(Get.currentContext).size.width,
        padding: const EdgeInsets.all(20.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(
              16.0,
            ),
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0x19000000),
              blurRadius: 24,
              offset: Offset(0, 11),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Your balance",
                    style: TextStyle(
                      fontSize: 12.0,
                    ),
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Row(
                    children: [
                      Text(
                        this,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10.0),
              decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: const Icon(
                Icons.wallet,
                size: 24.0,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DemoView extends StatefulWidget {
  const DemoView({Key? key}) : super(key: key);

  Widget build(context, DemoController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ExListView(
              futureBuilder: (page) async {
                var response = await Dio().get(
                  "https://reqres.in/api/users",
                  options: Options(
                    headers: {
                      "Content-Type": "application/json",
                    },
                  ),
                );
                return response;
              },
              builder: (index, item) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      backgroundImage: NetworkImage(
                        item["avatar"],
                      ),
                    ),
                    title: Text("${item["first_name"]}"),
                    subtitle: Text("${item["email"]}"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      // body: SingleChildScrollView(
      //   controller: ScrollController(),
      //   child: Container(
      //     padding: const EdgeInsets.all(20.0),
      //     child: Column(
      //       children: [
      //         Card(
      //           child: Container(
      //             width: MediaQuery.of(context).size.width,
      //             padding: const EdgeInsets.all(8.0),
      //             child: Column(
      //               children: const [],
      //             ),
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
    /*
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: ExListView(
                futureBuilder: (page) => ProductService().getProduct(page),
                builder: (index, item) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        backgroundImage: NetworkImage(
                          item["photo"] ??
                              "https://i.ibb.co/S32HNjD/no-image.jpg",
                        ),
                      ),
                      title: Text("${item["product_name"]}"),
                      subtitle: Text("${item["price"]}"),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
    */
  }

  @override
  State<DemoView> createState() => DemoController();
}

class ProductService {
  getProduct(page) async {
    debugPrint(
      "Kita lagi get data dari API nih di halaman $page",
    );
    var response = await Dio().get(
      "http://localhost:8080/api/products?page=1",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer dev_token",
        },
      ),
    );
    return response;
  }
}

/*
React itu, lebih lambat performa-nya daripada
Flutter (untuk versi Mobile)

Q: Tapi, apakah React itu jelek?
A: Tentu, nggak
karena kalo ngomongin pengembangan,
Yang paling cepet belum tentu paling bagus utk
kasus-nya temen temen


Golang vs Laravel
- Golang jauh lebih cepet daripada Laravel
Q: Apakah Laravel itu jadi jelek karena Golang jauh lebih cepat?

- Bikin query database gampang
- Fitur migrasi memudahkan
- Eloquent canggih


Native Java (Bagus juga kok)

Mending Postgre atau mysql

Kelas dasar-nya: (tiap pagi tapi gak tiap hari)
Jam 7-8 Pagi


YOUTUBE:
https://youtube.com/c/capekngoding

Grup Discord:
https://tinyurl.com/discord-berandal

Grup Whatsapp:
https://tinyurl.com/whatsapp-berandal

Q: Mending native apa hybrid?
A: Tergantung mau bikin apa.

Q: Mending flutter atau java native atau kotlin?
A: 
Kalo temen2 mau bikin aplikasi kayak gini:
- Ecommerce
- Point of Sales
- Fintech
- EMoney (Dana)
- Food Delivery (Gojek, Grab)
A: Lebih cocok pakai Flutter,
karena bikin UI-nya lebih cepet

- Aplikasi yang terhubung dengan sensor
Java sama Kotlin

- Kalo misalnya ada job,
Yang pake Native dan bkinnya lebih lama 
dengan Native
Tapi duitnya gede,
Kenapa ga kita ambil?

- tergantung skill
- tergantung cara kita negoisasi gaji
- tergantung dimana kita cari job-nya
==========================================
Temen2, kalo pengen gaji besar
Dan temen2 punya "sedikit" keberanian

Gak ada salah-nya,
Coba ngelamar di perusahaan luar
Minimal magang lah,
Karena gaji magang di luar juga itu udah gede banget
8 - 15 - 20

- Ini gak harus bisa bahasa inggris
- Karena banyak juga perusahaan yang liat Skill
- Karena banyak juga perusahaan yang liat Portopolio

- Coba aja deh, ngelamar ke 1000 perusahaan di luar
- Masa iya sih, ga ada 1 yang nyangkut

xxxx
Gua sendiri sangat kurang speaking 3/10
Tapi utk komunikasi gua paham (in chat)
xxx
- Temen temen yang belum lancar speaking in english
Tenang aja

Karena requirement minimal:
- Bisa chat dalam bahasa inggris 
(dan kita kan punya Google Translate)

Q: Ngelamar di 1000 perusahaan luar itu lewat mana
A: Gua udah coba cara,
Dan alhamdulillah banyak yang nolak gua
Ada ratusan , ada banyak banget
Tapi ada satu perusahaan yang  nerima

1. Facebook
2. Cari daftar startup di google, 
- boleh yang paling top
- boleh yang rising startup (peluang diterima lebih tinggi)
kumpulin emailnya,
taro di excell
lalu, submit semuanya bersamaan (cv * portpolio)
3. Cari situs jobstreet versi negara tersebut
www.glassdoor.com, 
https://www.reed.co.uk/

===============
1. Cari sebanyak banyak nya
2. Submit sebanyak banyak-nya
(Masa iya, dari 1000 yang dikirim ga keterima 1)
3. Cuek aja kalo ditolak
4. CARI Startup yang baru, itu better (karena peluangnya, lebih tinggi)
==========================================
Udah gw coba tips di atas, dengan profil gw seperti ini:
1. gak bisa enggres, (cuman bisa chatting, speaking jelek banget)
2. communication skill gw ga bagus 5/10
3. punya skill di bidan-nya
==========================================
KALAU KITA NGELAMAR KERJAAN KITA DI AJARIN LAGI NGGK YAA IT NYA
-----------
- Banyak perusahaan yang biasanya ngasih waktu
Untuk orang baru beradaptasi
Biasa-nya 1-4 minggu


-----
GAJI PROGRAMMER
Junior
Jakarta
8 - 15

Batam
8 - 20

Singapur
10 - 30

US & UK
25 - 35/45

Bandung
3 - 6
Yogya
2
*/
