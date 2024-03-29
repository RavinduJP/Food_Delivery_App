import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:food_delivery_app/data/repository/cart_repository.dart';
import 'package:food_delivery_app/models/cart_model.dart';
import 'package:food_delivery_app/models/products_model.dart';
import 'package:get/get.dart';

import '../utils/colors.dart';

class CartController extends GetxController {
  final CartRepository cartRepository;

  CartController({required this.cartRepository});

  Map<int, CartModel> _items = {};

  Map<int, CartModel> get Items => _items;

  void addItem(ProductModel product, int quantity) {
    var totalQuantity = 0;
    if(_items.containsKey(product.id)) {
      _items.update(product.id!, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value .img,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
          product: product,
        );
      });
      if(totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else {
      if (quantity > 0) {
        _items.putIfAbsent(
          product.id!,
              () {
            print("adding item to the cart id" + product.id!.toString() + "quantity" + quantity.toString());
            _items.forEach((key, value) {
              print("quantity is " + value.quantity.toString());
            });
            return CartModel(
              id: product.id,
              name: product.name,
              price: product.price,
              img: product.img,
              quantity: quantity,
              isExist: true,
              time: DateTime.now().toString(),
              product: product,
            );
          },
        );
      } else {
        Get.snackbar("Item count", "You should at least add an item in the cart!",
                backgroundColor: AppColors.mainColor,
                colorText: Colors.white,
              );
      }
    }
    update();
  }

  bool existInCart(ProductModel product) {
    if(_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if(_items.containsKey(product.id)) {
      _items.forEach((key, value) {
        if(key == product.id) {
          quantity = value.quantity!;
        }
      });
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach((key, value) {
       value.quantity = totalQuantity+value.quantity!;
    });
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map((e){
      return e.value;
    }).toList();
  }

  int get totalAmount {
    var total = 0;

    _items.forEach((key, value) {
      total += value.quantity! * value.price!;
    });
    return total;
  }

}
