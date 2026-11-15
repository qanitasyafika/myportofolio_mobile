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



