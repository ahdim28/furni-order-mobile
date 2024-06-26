import 'package:furni_order/models/product.dart';

final List<CategoryProductModel> categories = [
  CategoryProductModel(
    id: '1',
    name: 'Kursi',
    isActive: true,
  ),
  CategoryProductModel(
    id: '2',
    name: 'Meja',
    isActive: false,
  ),
  CategoryProductModel(
    id: '3',
    name: 'Sofa',
    isActive: false,
  ),
  CategoryProductModel(
    id: '4',
    name: 'Lemari',
    isActive: false,
  ),
];

final List<ProductModel> products = [
  ProductModel(
    id: '1',
    name: 'Luke Kursi Kantor Sandaran Tinggi - Hitam', 
    description: 'Penggunaan kursi secara tidak langsung dapat memengaruhi kinerja Anda di kantor. Semakin nyaman kursi, semakin rileks pula Anda dalam bekerja. Untuk itu gunakan Luke Kursi Kantor. Kursi bergaya modern ini memiliki dudukan empuk dan sandaran yang dapat menopang punggung dengan nyaman. Atur ketinggian kursi sesuai kenyamanan dengan menggunakan tuas di bawah dudukan dan ubah arah duduk dengan fitur putar pada kursi. Agar mudah dipindah, kursi ini dilengkapi roda di bagian kaki.',
    price: 2000000, 
    rating: 4.5, 
    reviewCount: 5,
    image: 'assets/images/products/1.jpg'
  ),
  ProductModel(
    id: '2',
    name: 'Urania Kursi Gaming - Putih / hitam',
    description: 'Informa menghadirkan Urania kursi untuk melengkapi kebutuhan para gamer saat beraktivitas di depan komputer. Kursi ini memiliki dudukan serta sandaran yang empuk dan nyaman untuk penggunaan dalam waktu yang lama. Anda dapat mengatur ketinggian kursi dan penopang lengan dengan mudah sesuai kenyamanan atau kebutuhan. Kursi ini dilengkapi bantal kepala yang dapat dilepas-pasang dan bantal lumbar pada bagian pinggang untuk kenyamanan optimal. Selain menghadirkan kenyamanan, kursi ini dapat menciptakan kesan premium pada ruangan karena desain futuristik serta perpaduan warna putih dan hitam yang menarik.',
    price: 2600000, 
    rating: 5, 
    reviewCount: 10,
    discountPercentage: 5,
    image: 'assets/images/products/2.jpg'
  ),
  ProductModel(
    id: '3',
    name: 'Halley Meja Kantor - Cokelat', 
    description: 'Halley meja kantor persembahan dari Informa ini merupakan pilihan tepat untuk melengkapi furnitur di kantor atau ruangan kerja Anda. Terbuat dari material berkualitas dengan finishing sempurna sehingga rangka kokoh, stabil, awet. Meja kantor ini dilengkapi dengan 3 laci dan 1 rak penyimpanan serbaguna. Memiliki desain modern dalam balutan motif serat kayu yang natural dengan permukaan cukup luas.',
    price: 1400000, 
    rating: 4, 
    reviewCount: 3,
    discountPercentage: 10,
    image: 'assets/images/products/3.jpg'
  ),
  ProductModel(
    id: '4',
    name: 'Rana Meja Tamu Rectangle - Cokelat Maple', 
    description: 'Tingkatkan elemen dekoratif yang mempercantik ruang tamu, ruang keluarga, atau area lainnya dengan meja tamu dari Informa ini. Pada bagian bawah dilengkapi rak penyimpanan untuk meletakkan koleksi buku, majalah, remot, atau barang lainnya secara efisien. Pada permukaan meja, Anda dapat meletakkan vas bunga, hiasan miniatur, atau aksesori dekorasi lainnya. Dirancang menggunakan material berkualitas dengan finishing sempurna sehingga rangka kokoh, stabil, dan awet.',
    price: 500000, 
    rating: 5, 
    reviewCount: 20,
    image: 'assets/images/products/4.jpg'
  ),
  ProductModel(
    id: '5',
    name: 'Selma Tasyi Sofa Modular Sudut Fabric - Cokelat',
    description: 'Dapatkan kenyamanan maksimal di rumah Anda dengan Selma sofa modular sudut. Dilengkapi dengan dudukan dan sandaran yang empuk, serta permukaan sofa yang nyaman, membuat Anda nyaman duduk berlama-lama. Dibuat dengan rangka kuat, koko, dan stabil, dan dapat mengubah posisi bangku sesuai keinginan Anda (kanan-kiri). Cocok diletakkan di ruang tamu dan ruang keluarga, Selma sofa modular sudut adalah pilihan terbaik untuk meningkatkan kenyamanan dan keindahan interior rumah Anda.',
    price: 4000000, 
    rating: 5, 
    reviewCount: 3,
    discountPercentage: 3,
    image: 'assets/images/products/5.jpg'
  ),
  ProductModel(
    id: '6',
    name: 'Selma Lewis Sofa Bed Fabric - Cokelat Muda',
    description: 'Rasakan kenyamanan bersantai dengan menghadirkan sofa tidur persembahan dari Selma ini. Sofa dengan 3 dudukan ini memiliki model sandaran yang dapat direbahkan menjadi tempat tidur. Dirancang menggunakan material berkualitas dengan kualitas busa yang empuk sehingga nyaman saat digunakan. Cocok diletakkan di ruang keluarga, ruang tamu, kamar tidur, dan area komersial lainnya.',
    price: 5000000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/6.jpg'
  ),
  ProductModel(
    id: '7',
    name: 'Selma Livia Lemari Pakaian 3 Pintu - Cokelat Oak',
    description: 'Lengkapi koleksi furnitur Anda dengan Livia lemari persembahan dari Selma yang dilengkapi 2 laci dan 3 rak dengan kompartemen yang cukup luas untuk menyimpan pakaian atau aksesori lainnya. Lemari ini memiliki gantungan pakaian dan juga dilengkapi dengan cermin pada salah satu pintunya. Dirancang dengan menggunakan material berkualitas sehingga rangka lemari kokoh dan awet. Lemari 3 pintu ini memiliki desain modern berwarna oak netral yang mudah untuk dipadukan dengan berbagai tema dekorasi ruangan.',
    price: 1900000, 
    rating: 5, 
    reviewCount: 5,
    image: 'assets/images/products/7.jpg'
  ),
  ProductModel(
    id: '8',
    name: 'Rana Lemari Pakaian 2 Pintu - Putih/cokelat Maple',
    description: 'Pakaian Anda akan lebih tertata dan terjaga keamanannya dengan lemari pakaian 2 pintu seri Rana. Didesain dengan model pintu geser yang dapat menghemat ruang, dilengkapi dengan cermin refleksi jernih, serta kunci untuk keamanan maksimal. Dihiasi dengan motif serat kayu natural, lemari pakaian ini tidak hanya memenuhi kebutuhan penyimpanan pakaian Anda, tetapi juga menambah sentuhan estetika pada ruangan.',
    price: 1500000, 
    rating: 5, 
    reviewCount: 2,
    image: 'assets/images/products/8.jpg',
    discountPercentage: 15,
  ),
];
