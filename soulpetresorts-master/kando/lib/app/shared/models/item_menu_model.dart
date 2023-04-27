import 'package:kando/app/pages/pets/pets_module.dart';
import 'package:kando/app/pages/rules_manual/rules_manual_page.dart';
import 'package:flutter/material.dart';

class ItemMenuModel {
  String url;
  String label;
  Widget route;

  ItemMenuModel({this.url, this.label});

  ItemMenuModel.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    route = json['route'];
  }

  Map<String, dynamic> get toJson => {
        'url': this.url,
        'label': this.label,
        'route': this.route,
      };

  static List<ItemMenuModel> fromJsonList(List list) {
    if (list == null) return [];
    return list.map((item) => ItemMenuModel.fromJson(item)).toList();
  }

  static List<ItemMenuModel> get getMenusLogout => ItemMenuModel.fromJsonList([
       /*
        {
          'url': 'assets/images/svg/pet-food.svg',
          'label': 'Produtos',
          'route': null
        },
        {
          'url': 'assets/images/svg/saloon.svg',
          'label': 'Serviços',
          'route': null
        },
        */
      ]);

  static List<ItemMenuModel> get getMenus => ItemMenuModel.fromJsonList([
        {
          'url': 'assets/images/svg/dog.svg',
          'label': 'Meus Pets',
          'route': PetsModule()
        },
        /* {
          'url': 'assets/images/svg/pet-food.svg',
          'label': 'Produtos',
          'route': ShoppingModule()
        },
        {
          'url': 'assets/images/svg/saloon.svg',
          'label': 'Serviços',
          'route': null
        },
        {
          'url': 'assets/images/svg/saloon.svg',
          'label': 'DayCare',
          'route': null
        },*/
        {
          'url': 'assets/images/svg/file.svg',
          'label': 'Regras',
          'route': RulesManualPage()
        },
        /*
        {
          'url': 'assets/images/svg/medic.svg',
          'label': 'Saúde',
          'route': null,
        },
        
        {
          'url': 'assets/images/svg/prices.svg',
          'label': 'Financeiro',
          'route': null
        },
        */
      ]);
}
