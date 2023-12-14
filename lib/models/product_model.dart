// class Laptops {
//   String? status;
//   String? message;
//   List<Product>? products = [];
//
//   Laptops(this.status, this.message, this.products);
//   Laptops.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     if (json['product'][0] != null) {
//       products = <Product>[];
//       json['product'][0].forEach((v) {
//         products!.add(Product.fromJson(v));
//       });
//     }
//   }
// }

class ProductModel {
  String? sId;
  String? status;
  String? category;
  String? name;
  dynamic price;
  String? description;
  String? image;
  String? company;
  dynamic countInStock;
  List<String>? images;
  dynamic iV;

  ProductModel(
    this.sId,
    this.status,
    this.category,
    this.name,
    this.price,
    this.description,
    this.image,
    this.company,
    this.countInStock,
    this.images,
    this.iV,
  );

  ProductModel.fromJson(dynamic json, int index) {
    sId = json['product'][index]['_id'];
    status = json['product'][index]['status'];
    category = json['product'][index]['category'];
    name = json['product'][index]['name'];
    price = json['product'][index]['price'];
    description = json['product'][index]['description'];
    image = json['product'][index]['image'];
    company = json['product'][index]['company'];
    images = json['product'][index]['images'].cast<String>();
    countInStock = json['product'][index]['countInStock'];
    iV = json['product'][index]['__v'];
  }
}
