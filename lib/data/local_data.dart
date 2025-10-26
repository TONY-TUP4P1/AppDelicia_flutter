import '../models/product.dart';

final List<Product> productsList = [
  Product(
    id: 'p1',
    name: 'PASTEL DE CHOCOLATE',
    description: 'Pastel de chocolate con fudge de relleno superior',
    price: 9.99,
    image: 'assets/images/cake_chocolate.png',
  ),
  Product(
    id: 'p2',
    name: 'PASTEL DE VAINILLA',
    description: 'Pastel con sabor a vainilla y banana',
    price: 12.50,
    image: 'assets/images/cake_vainilla.png',
  ),
  Product(
    id: 'p3',
    name: 'QUEQUITO DE FRESA',
    description: 'Bocadito para ocaciones especiales de fresa',
    price: 4.20,
    image: 'assets/images/cupcake_fresa.png',
  ),
  Product(
    id: 'p4',
    name: 'PIE DE LIMON',
    description: 'Pie con sabor a limon clasico',
    price: 6.00,
    image: 'assets/images/tarta_limon.png',
  ),
];
