import 'package:flutter/material.dart';

import '../../models/product_model.dart';

class ProductItem {
  Widget newCard({required ProductModel model, required BuildContext context}) =>
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, 'UpdateProduct', arguments: model);
        },
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Card(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(9.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 70,
                            ),
                            Text(
                              model?.name ?? '',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                                color: Colors.black,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${model.price} \$',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 20,
                                      color: Colors.black),
                                ),
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    )),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 50,
                  bottom: 100,
                  child: Image.network(
                    model.image ?? '',
                    width: 105,
                    height: 105,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
}

class DefaultTextFormField {
  final Key? key;
  final TextInputType keyboard;
  final TextEditingController controller;
  Function? submit;
  Function? change;
  Function? tap;
  final String label;
  final OutlinedBorder border;

  //final Icon prefix;
  final Function(String?)? validate;

  DefaultTextFormField(
    this.key,
    this.submit,
    this.change,
    this.tap,
    this.validate, {
    required this.keyboard,
    required this.controller,
    required this.label,
    required this.border,
    // required this.prefix,
  });
}

Widget defaultTextFormField(
  final Key? key,
  final TextInputType keyboard,
  final TextEditingController controller,
  final Function(String?) submit,
  final Function(String?) change,
  final GestureTapCallback? tap,
  final String label,
  final InputBorder border,
  final Icon prefix,
  final FormFieldValidator<String>? validate,
) =>
    TextFormField(
      key: key,
      keyboardType: keyboard,
      controller: controller,
      onFieldSubmitted: submit,
      onChanged: change,
      onTap: tap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        border: border,
        //prefixIcon: prefix,
      ),
    );

//Default Button
class DefaultButton {
  final double width;
  final double height;
  final Color buttonColor;
  final Function function;
  final String text;
  final Color textColor;
  final double? fontSize;

  //Constructor
  DefaultButton(
      {required this.width,
      required this.height,
      required this.buttonColor,
      required this.function,
      required this.text,
      required this.textColor,
      required this.fontSize});
}

Widget defaultButton(
  final double width,
  final double height,
  final Color buttonColor,
  final Function,
  final String text,
  final Color textColor,
  final double? fontSize,
) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: buttonColor,
      ),
      child: MaterialButton(
        onPressed: Function,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
          ),
        ),
      ),
    );

void navigateAndDelPast(context, screen) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (context) => screen), (route) {
    return false;
  });
}

void navigateTo(
  context,
  screen,
) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
}
