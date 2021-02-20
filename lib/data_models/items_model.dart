class ItemsData {
  ItemsData({
    this.data,
  });

  List<Item> data;

  factory ItemsData.fromJson(Map<String, dynamic> json) => ItemsData(
    data: List<Item>.from(json["data"].map((x) => Item.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Item {
  Item({
    this.id,
    this.modelName,
    this.price,
    this.height,
    this.width,
    this.weight,
    this.category,
    this.isFav,
    this.quantity
  });

  int id;
  String modelName;
  String price;
  String height;
  String width;
  String weight;
  String category;
  bool isFav = false;
  int quantity;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    id: json["id"],
    modelName: json["model_name"],
    price: json["price"],
    height: json["height"],
    width: json["width"],
    weight: json["weight"],
    category: json["category"],
    isFav: false,
    quantity: 0
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "model_name": modelName,
    "price": price,
    "height": height,
    "width": width,
    "weight": weight,
    "category": category,
  };
}