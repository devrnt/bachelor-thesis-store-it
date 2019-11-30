class Product {
  String title;
  String description;
  String imageUrl;
  num price;

  Product({this.title, this.description, this.imageUrl, this.price});
}

final initialProducts = [
  Product(
    title: 'Adidas Schoen',
    description: 'Adidas Grand Court',
    imageUrl:
        'https://assets.adidas.com/images/w_840,h_840,f_auto,q_auto:sensitive,fl_lossy/1e5ac363913e427a9eafaa4601160a8a_9366/Grand_Court_Schoenen_wit_EF0103_01_standard.jpg',
    price: 39.95,
  ),
  Product(
    title: 'Lenovo Laptop',
    description: 'Lenovo IdeaPad S340-15IWL 81N800JVMB Azerty',
    imageUrl:
        'https://image.coolblue.be/max/500x500/products/1252657',
    price: 699.00,
  ),
  Product(
    title: 'Apple iPad ',
    description: 'Apple iPad (2018) 128 GB Wifi Space Gray + Pencil',
    imageUrl:
        'https://image.coolblue.be/600x315/products/1009557',
    price: 475.00,
  ),
];
