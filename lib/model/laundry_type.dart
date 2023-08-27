class LaundryType {
  String name;
  String description;
  String maxWeight;
  String price;
  String imageAsset;


  LaundryType({
    required this.name,
    required this.description,
    required this.maxWeight,
    required this.price,
    required this.imageAsset
});
}

var laundryTypeList = [
  LaundryType(
    name: 'Baju dan Celana',
    description: 'termasuk Kaos, Kemeja, Celana Pendek, Celana Panjang Bahan',
    maxWeight: '< 8 Kg',
    price: 'Rp 30.000',
    imageAsset:'images/tshirt.jpg'
  ),
  LaundryType(
      name: 'Jeans',
      description: 'Semua Pakaian berbahan Denim / Jeans',
      maxWeight: '< 8 Kg',
      price: 'Rp 50.000',
      imageAsset:'images/jeans.jpg'
  ),
  LaundryType(
      name: 'Batik',
      description: 'Semua Pakaian berjenis Batik',
      maxWeight: '< 8 Kg',
      price: 'Rp 75.000',
      imageAsset:'images/batik.jpg'
  ),
  LaundryType(
      name: 'Selimut & Bed Cover',
      description: 'tergolong Selimut, Bed Cover, Seprei ',
      maxWeight: '< 8 Kg',
      price: 'Rp 80.000',
      imageAsset:'images/blanket.jpg'
  ),
  LaundryType(
      name: 'Sepatu',
      description: 'Semua Jenis Bahan Sepatu',
      maxWeight: 'Tergantung Jumlah Pasang Sepatu',
      price: 'Rp 35.000',
      imageAsset:'images/shoes.jpg'
  ),
];