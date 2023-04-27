

class ProductModel {
  int id;
  String img;
  String title;
  String price;

  ProductModel({
    this.id,
    this.img,
    this.title,
    this.price,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    img = json['img'];
    title = json['title'];
    price = json['price'];
  }

  Map<String, dynamic> get toJson => {
        'id': this.id,
        'img': this.img,
        'title': this.title,
        'price': this.price,
      };

  static List<ProductModel> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => ProductModel.fromJson(item)).toList();
  }

  static List<ProductModel> get getData => ProductModel.fromJsonList([
        {
          'id': 1,
          'img': '',
          'title': 'Cinto de Segurança Chalesco para Cães',
          'price': '34,90',
        },
        {
          'id': 2,
          'img': '',
          'title': 'Guia Retrátil até 15 Kg - Azul',
          'price': '29,90',
        },
        {
          'id': 3,
          'img': '',
          'title': 'Guia Retrátil até 15 Kg - Vermelho',
          'price': '29,90',
        },
        {
          'id': 4,
          'img': '',
          'title': 'Guia e peitoral Barcelona - Azul',
          'price': '34,90',
        },
        {
          'id': 5,
          'img': '',
          'title':
              'Pestisco Nestlé Purina Dog chow Carinhas Mix de Frutas para Cães',
          'price': '5,95',
        },
        {
          'id': 6,
          'img': '',
          'title': 'Bifinho Kelco Keldog Criadores carne e Cereais Raças',
          'price': '19,90',
        },
      ]);
}
