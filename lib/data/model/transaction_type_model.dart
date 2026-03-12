import 'package:flutter/material.dart';
import 'package:fymoney/app/translations/tr_strings.dart';
import 'package:fymoney/data/model/transaction_model.dart';
import 'package:fymoney/ui/theme/icons/vector.dart';

class TransactionTypeModel {
  final Color color;
  final String name;
  final String icon;
  final int index;
  final TransactionType type;

  TransactionTypeModel({
    required this.color,
    required this.index,
    required this.icon,
    required this.name,
    required this.type,
  });

  static List<TransactionTypeModel> localTypes = List.of([
    TransactionTypeModel(
      color: Color(0xFF9A4E77),
      index: 0,
      name: Strings.products,
      type: .spending,
      icon: Vector.icProducts,
    ),
    TransactionTypeModel(
      color: Color(0xFF5C89CD),
      index: 1,
      name: Strings.dwelling,
      type: .spending,
      icon: Vector.icDwelling,
    ),
    TransactionTypeModel(
      color: Color(0xFF908383),
      index: 2,
      name: Strings.car,
      type: .spending,
      icon: Vector.icCar,
    ),
    TransactionTypeModel(
      color: Color(0xFF7EAC5A),
      index: 3,
      name: Strings.reataurants,
      type: .spending,
      icon: Vector.icReataurants,
    ),
    TransactionTypeModel(
      color: Color(0xFFB872C3),
      index: 4,
      name: Strings.clothes,
      type: .spending,
      icon: Vector.icClothes,
    ),
    TransactionTypeModel(
      color: Color(0xFFDACA39),
      index: 5,
      name: Strings.taxi,
      type: .spending,
      icon: Vector.icTaxi,
    ),

    TransactionTypeModel(
      color: Color(0xFFFF6231),
      index: 6,
      name: Strings.transport,
      type: .spending,
      icon: Vector.icTransport,
    ),
    TransactionTypeModel(
      color: Color(0xFFD64242),
      index: 7,
      name: Strings.health,
      type: .spending,
      icon: Vector.icHealth,
    ),
    TransactionTypeModel(
      color: Color(0xFFEE9A38),
      index: 8,
      name: Strings.vacation,
      type: .spending,
      icon: Vector.icVacation,
    ),
    TransactionTypeModel(
      color: Color(0xFF2A561B),
      index: 9,
      name: Strings.sport,
      type: .spending,
      icon: Vector.icSport,
    ),
    TransactionTypeModel(
      color: Color(0xFF553859),
      index: 10,
      name: Strings.connection,
      type: .spending,
      icon: Vector.icConnection,
    ),
    TransactionTypeModel(
      color: Color(0xFF468B00),
      index: 11,
      name: Strings.pets,
      type: .spending,
      icon: Vector.icPets,
    ),
    TransactionTypeModel(
      color: Color(0xFF11307E),
      index: 12,
      name: Strings.hugiene,
      type: .spending,
      icon: Vector.icHugiene,
    ),
    TransactionTypeModel(
      color: Color(0xFF975F0B),
      index: 13,
      name: Strings.beaches,
      type: .spending,
      icon: Vector.icBeaches,
    ),
    TransactionTypeModel(
      color: Color(0xFF6D907B),
      index: 14,
      name: Strings.gifts,
      type: .spending,
      icon: Vector.icGifts,
    ),

    TransactionTypeModel(
      color: Color(0xFF6D907B),
      index: 0,
      name: Strings.salary,
      type: .earning,
      icon: Vector.icSalary,
    ),
    TransactionTypeModel(
      color: Color(0xFF63A91C),
      index: 1,
      name: Strings.deposit,
      type: .earning,
      icon: Vector.icDeposit,
    ),

    TransactionTypeModel(
      color: Color(0xFFBD446F),
      index: 2,
      name: Strings.avings,
      type: .earning,
      icon: Vector.icSavings,
    ),
  ]);
}
