class FavoriteModel {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  String? company;
  int? countInStock;
  int? iV;
  dynamic quantity;
  dynamic totalPrice;

  FavoriteModel(
      {this.sId,
        this.status,
        this.category,
        this.name,
        this.price,
        this.description,
        this.image,
        this.company,
        this.countInStock,
        this.iV,
        this.quantity,
        this.totalPrice});

  FavoriteModel.fromJson(dynamic json, int index) {
    sId = json['favoriteProducts'][index]['_id'];
    status = json['favoriteProducts'][index]['status'];
    category = json['favoriteProducts'][index]['category'];
    name = json['favoriteProducts'][index]['name'];
    price = json['favoriteProducts'][index]['price'];
    description = json['favoriteProducts'][index]['description'];
    image = json['favoriteProducts'][index]['image'];
    company = json['favoriteProducts'][index]['company'];
    countInStock = json['favoriteProducts'][index]['countInStock'];
    iV = json['favoriteProducts'][index]['__v'];
    quantity = json['favoriteProducts'][index]['quantity'];
    totalPrice = json['favoriteProducts'][index]['totalPrice'];
  }
}
