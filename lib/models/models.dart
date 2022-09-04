class Model {
  int? id;
  String? name;
  String? brand;
  int? price;

  Model({this.id, this.name, this.brand, this.price});
  factory Model.fromJson(Map<String, dynamic> json) {
    return Model(
        id: json['id'],
        name: json['name'],
        brand: json['brand'],
        price: json['price']);
  }
  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'brand': brand, 'price': price};
}
