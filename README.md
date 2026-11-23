## Tugas 7
1. Widget tree adalah struktur hierarki yang menggambarkan susunan widget dalam aplikasi Flutter. Setiap widget dapat memiliki widget lain sebagai anaknya (child). Widget induk berfungsi mengatur bagaimana widget anak ditampilkan, misalnya dalam hal tata letak, ukuran, warna, dan posisi.

Hubungan parent-child ini membuat tampilan aplikasi lebih terstruktur. Contohnya, widget Row menjadi induk dari tiga InfoCard, sedangkan GridView.count menjadi induk dari beberapa ItemCard. Dengan susunan tersebut, setiap widget dapat memiliki fungsi masing-masing tetapi tetap menjadi bagian dari satu tampilan aplikasi.

2. Widget yang digunakan dalam proyek ini antara lain MaterialApp untuk mengatur aplikasi, Scaffold sebagai struktur halaman, AppBar untuk menampilkan judul, Text untuk menampilkan tulisan, Padding dan SizedBox untuk mengatur jarak, Column dan Row untuk menyusun widget, Card dan Container untuk membentuk tampilan kartu, Center untuk mengatur posisi, serta GridView.count untuk menyusun tombol. Selain itu, terdapat Material dan InkWell untuk membuat tombol yang dapat ditekan, Icon untuk menampilkan ikon, serta SnackBar untuk menampilkan pesan sementara. Saya juga membuat widget sendiri, yaitu MyApp, MyHomePage, InfoCard, dan ItemCard agar kode lebih terstruktur.

3. MaterialApp merupakan widget utama yang digunakan untuk mengatur dasar aplikasi Flutter, seperti tema, navigasi, dan halaman awal. Widget ini biasanya menjadi root widget karena menjadi tempat pengaturan utama sebelum aplikasi menampilkan halaman lainnya. Pada proyek ini, MaterialApp digunakan untuk mengatur tema dan menampilkan MyHomePage sebagai halaman utama.

4. StatelessWidget merupakan widget yang tampilannya tidak memiliki state internal yang berubah selama aplikasi berjalan, sedangkan StatefulWidget dapat menyimpan dan mengubah state sehingga tampilannya bisa diperbarui sesuai kondisi tertentu. StatelessWidget cocok digunakan untuk tampilan yang relatif tetap, sementara StatefulWidget digunakan ketika aplikasi membutuhkan perubahan tampilan berdasarkan interaksi pengguna. Pada proyek ini, MyHomePage menggunakan StatelessWidget karena informasi dan susunan tampilannya tidak membutuhkan perubahan state internal.

5. BuildContext adalah objek yang menunjukkan posisi sebuah widget di dalam widget tree. BuildContext penting karena memungkinkan widget mengakses informasi dari widget lain yang berada di atasnya. Pada proyek ini, context digunakan untuk mengambil tema aplikasi melalui Theme.of(context), mengetahui ukuran layar melalui MediaQuery.of(context), dan menampilkan SnackBar melalui ScaffoldMessenger.of(context).

6. Hot reload merupakan fitur Flutter yang memungkinkan perubahan kode langsung diterapkan tanpa harus memulai ulang aplikasi dari awal. Sementara itu, hot restart akan menjalankan kembali aplikasi dan mengatur ulang state yang sedang berjalan. Hot reload biasanya digunakan ketika mengubah tampilan, warna, atau teks, sedangkan hot restart diperlukan ketika perubahan membutuhkan inisialisasi ulang aplikasi. Full restart biasanya dibutuhkan ketika terdapat perubahan pada konfigurasi native Android atau iOS maupun dependensi tertentu.

## AI DISCLOSURE

Dalam pengerjaan tugas ini, saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi dan mengatasi beberapa kendala selama proses pengerjaan. Saya menggunakan AI dengan memberikan pesan error, dan screenshot Warning dapat memperoleh penjelasan serta arahan perbaikan. Penggunaan AI dalam tugas ini berperan sebagai pendamping pembelajaran dan debugging, sedangkan pemahaman, pemeriksaan, serta pengujian hasil akhir tetap saya yang melakukan double check.


### Tugas 8

1. Navigator.push() digunakan untuk membuka halaman baru dengan menambahkan route ke atas halaman yang sedang aktif. Navigator.pushReplacement() digunakan untuk mengganti halaman aktif dengan halaman baru, sedangkan Navigator.pop() digunakan untuk menutup halaman aktif dan kembali ke halaman sebelumnya. Pada tugas ini, Navigator.push() digunakan untuk membuka formulir Edukasi dari kartu aksi. Sementara itu, opsi Home pada drawer menggunakan Navigator.pushReplacementNamed() untuk mengganti halaman formulir dengan halaman utama.

2. Scaffold berfungsi sebagai struktur utama halaman, AppBar digunakan untuk menampilkan judul halaman, sedangkan Drawer menyediakan navigasi antarhalaman. Penggunaan komponen tersebut membantu menjaga struktur aplikasi tetap konsisten. Contohnya, warna indigo digunakan pada AppBar halaman utama, halaman formulir, dan bagian DrawerHeader.

3. SingleChildScrollView dipilih agar formulir tetap dapat digulir ketika ruang layar terbatas atau keyboard muncul. Padding digunakan untuk memberikan jarak antara komponen formulir, sedangkan SizedBox digunakan untuk mengatur jarak antarinput dan tombol. Dengan susunan tersebut, seluruh input dan tombol Simpan tetap dapat dijangkau pada layar berukuran kecil.

4. GlobalKey<FormState> digunakan untuk mengakses dan mengelola kondisi Form. Validator berfungsi memeriksa apakah setiap input memenuhi aturan yang ditentukan, sedangkan validate() menjalankan seluruh validator ketika tombol Simpan ditekan. Contohnya, input nama institusi yang hanya berisi spasi akan ditolak karena tidak memiliki karakter yang valid setelah menggunakan trim(). Penggunaan keyboard numerik saja juga belum cukup untuk menjamin tahun yang dimasukkan benar karena pengguna masih dapat memasukkan tahun dengan jumlah digit yang tidak sesuai atau tahun lulus yang lebih awal daripada tahun masuk.


## AI DISCLOSURE

Dalam pengerjaan Tugas 8, saya menggunakan ChatGPT sebagai alat bantu untuk memahami instruksi tugas. Saya menggunakan AI dengan memberikan pesan error, dan screenshot Warning dapat memperoleh penjelasan serta arahan perbaikan. 

Saya tetap bertanggung jawab untuk memeriksa kode, menjalankan aplikasi, melakukan pengujian, dan memperbaiki kesalahan yang ditemukan. Saya juga memahami bahwa hasil AI tidak selalu langsung sesuai dengan lingkungan dan versi Flutter yang digunakan sehingga tetap diperlukan pemeriksaan secara manual.





