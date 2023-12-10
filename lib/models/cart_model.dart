// class CartModel {
//   List<CartProducts>? products;
//
//   CartModel({this.products});
//
//   CartModel.fromJson(dynamic json) {
//     if (json['products'] != null) {
//       products = <CartProducts>[];
//       json['products'].forEach((v) {
//         products!.add(CartProducts.fromJson(v));
//       });
//     }
//   }
// }

class CartProducts {
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

  CartProducts(
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

  CartProducts.fromJson(dynamic json, int index) {
    sId = json['products'][index]['_id'];
    status = json['products'][index]['status'];
    category = json['products'][index]['category'];
    name = json['products'][index]['name'];
    price = json['products'][index]['price'];
    description = json['products'][index]['description'];
    image = json['products'][index]['image'];
    company = json['products'][index]['company'];
    countInStock = json['products'][index]['countInStock'];
    iV = json['products'][index]['__v'];
    quantity = json['products'][index]['quantity'];
    totalPrice = json['products'][index]['totalPrice'];
  }
}
