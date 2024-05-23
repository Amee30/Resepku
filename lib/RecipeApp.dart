import 'package:Resepku/DrawerContent.dart';
import 'package:flutter/material.dart';

class RecipeAppMenu extends StatelessWidget {
  RecipeAppMenu({super.key});

  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        leading: IconButton(onPressed: () => _scaffoldkey.currentState!.openDrawer(),
            icon: const Icon(Icons.menu,color: Colors.white,)),
        title: Image.asset(
          'assets/appbaricon.png',
          height: 50,
          width: 80,
          fit: BoxFit.fill,
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(onPressed: (){}, icon: const Icon(Icons.search,color: Colors.white,))
        ],
      ),
      drawer: const Drawercontent(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Resep 1
            resepCointainer(
                context, 'Resep Nasi Goreng', 'assets/nasigoreng.jpg', const ResepNasiGrng()
            ),
            //Resep 2
            resepCointainer(
                context, 'Resep Telur Dadar', 'assets/telurdadar.jpg', const ResepTelurDDR()
            ),
            // Resep 3
            resepCointainer(
                context, 'Resep Rendang Sapi', 'assets/rendang.jpg', const ResepRendang()
            ),
            // Resep 4
            resepCointainer(
                context, 'Resep Bakso', 'assets/bakso.jpg', const ResepBakso()
            ),
            // Resep 5
            resepCointainer(
                context, 'Resep Nasi Kuning', 'assets/nasikuning.jpg', const ResepNasiKng()
            ),
            // Resep 6
            resepCointainer(
                context, 'Resep Capcay', 'assets/capcay.jpg', const ResepCapCay()
            ),
            // Resep 7
            resepCointainer(
                context, 'Resep Ayam Goreng', 'assets/ayamgoreng.jpg', const ResepAyamGrng()
            ),
          ],
        ),
      ),
    );
  }
}

  Widget resepCointainer(BuildContext context, String title, String imgPath, Widget targetPage){
    return Container(
      height: 150,
      width: 400,
      margin: const EdgeInsets.all(20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage(imgPath),
              fit: BoxFit.cover
          )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => targetPage));
              },
              child: const Text('Lihat Resep'))
        ],
      ),
    );
  }


class ResepNasiGrng extends StatelessWidget {
  const ResepNasiGrng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Nasi Goreng', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

3-4 piring nasi putih dingin
2 butir telur, kocok lepas
3 siung bawang putih, cincang halus
2 batang daun bawang, iris tipis
3 sdm kecap manis
2 sdm minyak goreng
1 sdm saus cabai (opsional)
Garam secukupnya
Merica bubuk secukupnya

Pelengkap (opsional):

Kerupuk
Acar mentimun dan wortel

Cara Membuat:

Panaskan minyak goreng dalam wajan besar atau wajan khusus nasi goreng.
Tumis bawang putih hingga harum dan matang.
Masukkan telur kocok, aduk cepat hingga setengah matang.
Tambahkan nasi putih dingin, aduk rata dengan telur dan bawang putih.
Tuangkan kecap manis dan saus cabai (jika menggunakan), aduk kembali hingga merata.
Tambahkan garam dan merica bubuk secukupnya sesuai selera.
Masukkan daun bawang, aduk sebentar hingga semua bahan tercampur rata dan nasi sedikit berkerak.
Angkat dan sajikan nasi goreng panas dengan pelengkap yang diinginkan seperti kerupuk, acar mentimun, dan wortel.
Selamat mencoba! Semoga berhasil dan enak!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepTelurDDR extends StatelessWidget {
  const ResepTelurDDR({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Telur Dadar', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

3 butir telur
1 batang daun bawang, iris halus
1/2 sdt garam
1/4 sdt merica bubuk
1 sdm minyak goreng

Cara Membuat:

Kocok telur dalam sebuah mangkuk besar.
Tambahkan daun bawang, garam, dan merica bubuk ke dalam telur kocok. Aduk rata.
Panaskan minyak goreng di wajan dengan api sedang.
Tuangkan campuran telur ke dalam wajan panas. Ratakan permukaannya dengan sendok atau spatula.
Biarkan telur dadar mengeras di bagian bawah sekitar 1-2 menit atau hingga permukaannya cukup padat.
Balik telur dadar dengan spatula dan masak sisi lainnya hingga berwarna kecokelatan.
Angkat telur dadar dan letakkan di piring saji.
Potong telur dadar sesuai selera dan sajikan selagi hangat.

Selamat menikmati telur dadar yang lezat ini!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepRendang extends StatelessWidget {
  const ResepRendang({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Rendang Sapi', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

500 gram daging sapi (pilih bagian yang berlemak untuk hasil yang lebih gurih)
400 ml santan kental
2 lembar daun salam
2 batang serai, memarkan
5 lembar daun jeruk
3 cm lengkuas, memarkan
4 cm jahe, memarkan
5 siung bawang merah
3 siung bawang putih
5 buah cabai merah (sesuai selera)
3 buah cabai rawit merah (jika suka pedas)
1 sdm ketumbar bubuk
1/2 sdm jintan bubuk
1 sdt merica bubuk
1 sdm gula merah, sisir
Garam secukupnya
Minyak untuk menumis

Cara Membuat:

Persiapan Daging: Cuci bersih daging sapi, potong-potong sesuai selera, kemudian rebus dalam air mendidih hingga setengah matang. Tiriskan dan sisihkan.
Bumbu Halus: Haluskan bawang merah, bawang putih, cabai merah, dan cabai rawit.
Tumis Bumbu: Panaskan minyak di wajan, tumis bumbu halus hingga harum dan matang.
Tambahkan Rempah-Rempah: Masukkan daun salam, serai, daun jeruk, lengkuas, dan jahe. Aduk rata.
Tambahkan Daging Sapi: Masukkan potongan daging sapi yang telah direbus ke dalam wajan, aduk rata dengan bumbu.
Tambahkan Santan: Tuangkan santan kental ke dalam wajan, aduk rata dan biarkan mendidih.
Tambahkan Bumbu Tambahan: Masukkan ketumbar bubuk, jintan bubuk, merica bubuk, gula merah, dan garam. Aduk kembali hingga semua bahan tercampur rata.
Pengolahan Terakhir: Masak rendang dengan api kecil hingga santan menyusut dan bumbu meresap ke dalam daging sapi. Aduk sesekali untuk menghindari agar bumbu tidak gosong.
Penghujung Masak: Jika sudah mendekati kering dan bumbu meresap, koreksi rasa sesuai selera.
Sajikan: Angkat rendang sapi dari wajan dan sajikan dalam piring saji. Rendang sapi siap dinikmati dengan nasi hangat.

Selamat mencoba dan menikmati rendang sapi yang lezat ini!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepBakso extends StatelessWidget {
  const ResepBakso({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Bakso', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

Untuk Bakso:

500 gram daging sapi giling
100 gram tepung tapioka atau tepung sagu
2 butir telur
3 siung bawang putih, haluskan
2 sdt garam
1 sdt merica bubuk
1 sdm minyak wijen (opsional)

Untuk Kuah:

1 liter air
2 lembar daun jeruk
2 batang serai, memarkan
2 cm jahe, memarkan
2 sdm kecap manis
1 sdm kecap asin
1 sdt gula merah
Garam secukupnya
Merica bubuk secukupnya

Pelengkap (opsional):

Mi rebus
Sawi hijau atau sawi putih, potong-potong
Bawang goreng
Seledri, iris halus
Sambal atau saus sambal
Cara Membuat:

Membuat Bakso:
Campur daging sapi giling, tepung tapioka, telur, bawang putih, garam, merica bubuk, dan minyak wijen (jika menggunakan) dalam satu wadah. Aduk rata hingga adonan tercampur dengan baik.
Diamkan adonan selama kurang lebih 30 menit agar bumbu meresap.
Bentuk adonan menjadi bulatan-bulatan kecil untuk bakso.

Memasak Bakso:
Rebus air dalam panci besar hingga mendidih.
Masukkan bakso yang telah dibentuk ke dalam air mendidih. Aduk perlahan agar bakso tidak saling menempel.
Masak hingga bakso mengapung dan matang. Angkat dan tiriskan.

Membuat Kuah:
Rebus air dalam panci, tambahkan daun jeruk, serai, dan jahe. Rebus hingga air mendidih dan aroma rempahnya keluar.
Tambahkan kecap manis, kecap asin, gula merah, garam, dan merica bubuk. Aduk rata.
Koreksi rasa sesuai selera. Biarkan kuah mendidih sejenak.

Penyajian:
Siapkan mangkuk, tambahkan mi rebus, potongan sayuran, dan bakso yang telah direbus.
Tuangkan kuah panas ke dalam mangkuk.
Hias dengan bawang goreng dan seledri.
Sajikan bakso dengan sambal atau saus sambal untuk tambahan rasa pedas.
Selamat menikmati bakso yang Anda buat sendiri di rumah!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepNasiKng extends StatelessWidget {
  const ResepNasiKng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Nasi Kuning', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

2 gelas beras
400 ml santan kental
600 ml air
2 lembar daun salam
2 batang serai, memarkan
3 cm lengkuas, memarkan
1 cm kunyit, memarkan atau 1 sdt bubuk kunyit
1 sdt ketumbar bubuk
1 sdt garam
1 sdm minyak untuk menumis

Bumbu Halus:

4 siung bawang merah
3 siung bawang putih
2 butir kemiri, sangrai

Pelengkap:

Telur dadar
Ayam goreng
Irisan mentimun
Irisan tomat
Kerupuk
Sambal

Cara Membuat:

Menyiapkan Bumbu Halus:
Haluskan bawang merah, bawang putih, dan kemiri dengan blender atau ulekan.

Memasak Nasi:
Cuci beras hingga bersih, tiriskan.
Panaskan minyak dalam panci, tumis bumbu halus hingga harum.
Masukkan daun salam, serai, dan lengkuas. Aduk rata.
Tambahkan bubuk kunyit dan ketumbar, aduk kembali hingga bumbu tercampur dengan baik.
Masukkan beras yang telah dicuci, aduk hingga bumbu merata dengan beras.
Tuangkan santan kental dan air, aduk rata.
Tambahkan garam, aduk kembali hingga semua bahan tercampur rata.
Tutup panci dan masak nasi hingga matang dengan api kecil.

Penyajian:
Angkat nasi kuning dan sajikan dalam piring saji.
Hias dengan telur dadar, ayam goreng, irisan mentimun, irisan tomat, dan kerupuk.
Sajikan dengan sambal sebagai pelengkap.

Selamat menikmati nasi kuning yang Anda buat sendiri di rumah! Selamat mencoba!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepCapCay extends StatelessWidget {
  const ResepCapCay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Cap Cay', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

200 gram daging ayam, potong dadu
200 gram udang, kupas kulit dan bersihkan
100 gram wortel, potong tipis
100 gram kol, potong kasar
100 gram buncis, potong serong
1 buah paprika merah, potong kotak
1 buah paprika hijau, potong kotak
3 batang daun bawang, iris halus
3 siung bawang putih, cincang halus
2 sdm saus tiram
2 sdm kecap manis
1 sdm kecap asin
1 sdt gula pasir
1/2 sdt merica bubuk
1 sdt maizena, larutkan dengan sedikit air
500 ml air
Minyak goreng secukupnya
Garam secukupnya

Cara Membuat:

Menggoreng Bahan Utama:
Panaskan minyak goreng dalam wajan, tumis bawang putih hingga harum.
Masukkan daging ayam, tumis hingga berubah warna.
Tambahkan udang, aduk rata hingga udang berubah warna.
Menambahkan Sayuran:
Masukkan wortel, kol, buncis, paprika merah, dan paprika hijau. Aduk rata dan tumis hingga sayuran layu.

Membuat Kuah:
Tuangkan air ke dalam wajan, biarkan mendidih.
Tambahkan saus tiram, kecap manis, kecap asin, gula pasir, merica bubuk, dan garam. Aduk rata.
Penyelesaian:
Tambahkan larutan maizena, aduk rata hingga kuah mengental.
Terakhir, masukkan daun bawang iris dan aduk sebentar.
Angkat dan sajikan Capcay panas dengan nasi hangat.

Selamat mencoba dan menikmati Capcay yang Anda buat sendiri di rumah!
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class ResepAyamGrng extends StatelessWidget {
  const ResepAyamGrng({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Resep Ayam Goreng', style: TextStyle(fontSize: 20, color: Colors.white),),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            child: const Text(
              '''
Bahan:

1 ekor ayam, potong menjadi 8 bagian
3 siung bawang putih, haluskan
2 cm jahe, haluskan
2 batang serai, memarkan
3 lembar daun salam
2 lembar daun jeruk
1 sdt garam
1/2 sdt merica bubuk
1/2 sdt ketumbar bubuk
1 sdm kecap manis
Minyak goreng secukupnya

Bumbu Marinasi:

1 sdm kecap manis
1 sdt garam
1/2 sdt merica bubuk
Cara Membuat:

Marinasi Ayam:
Campurkan ayam dengan bumbu marinasi (kecap manis, garam, dan merica bubuk). Diamkan selama 30 menit hingga bumbu meresap.

Membuat Bumbu Halus:
Haluskan bawang putih dan jahe dengan blender atau ulekan.

Menggoreng Ayam:
Panaskan minyak goreng dalam wajan dengan api sedang.
Tumis bumbu halus, serai, daun salam, dan daun jeruk hingga harum.
Masukkan potongan ayam yang telah dimarinasi ke dalam wajan, goreng hingga kedua sisi berubah warna dan ayam matang dengan baik.

Penyajian:
Angkat ayam goreng dan tiriskan di atas kertas tisu untuk menghilangkan kelebihan minyak.
Ayam goreng siap disajikan panas dengan nasi hangat dan sambal pilihan.
Selamat mencoba dan menikmati ayam goreng yang Anda buat sendiri di rumah! Selamat 
              ''',
              textAlign: TextAlign.start,
            ),
          )
        ],
      ),
    );
  }
}

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('About App', style: TextStyle(color: Colors.white),),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Resepku',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Deskripsi:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Resepku adalah sebuah aplikasi yang dirancang untuk para pecinta memasak, '
                  'baik pemula maupun yang sudah mahir dalam seni kuliner. '
                  'Aplikasi ini menyediakan beragam resep masakan dari berbagai belahan dunia, mulai dari masakan tradisional hingga masakan kontemporer. '
                  'Dengan tampilan yang bersih dan mudah digunakan, Resepku memungkinkan pengguna untuk menjelajahi berbagai resep, menandai favorit mereka, '
                  'dan bahkan berbagi resep dengan teman-teman mereka.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}