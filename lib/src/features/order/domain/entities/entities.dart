import 'package:flutter/material.dart';

class OrderUI {
  final String orderName;
  final List<OrderStatus> statuses;

  OrderUI({required this.orderName, required this.statuses});
}

class OrderStatus {
  final int id;
  final String name;
  final String date;
  final bool isCompleted;
  final Color color;
  final IconData icon;
  final int statusId;

  OrderStatus({
    required this.id,
    required this.name,
    required this.date,
    required this.isCompleted,
    required this.color,
    required this.icon,
    required this.statusId,
  });

  static final allStatus = [
    OrderStatus(
      id: 0,
      name: 'طلب جديد',
      date: 'dateOrder',
      isCompleted: false,
      color: Colors.blue,
      icon: Icons.shopping_cart,
      statusId: 0,
    ),
    OrderStatus(
      id: 1,
      name: "قيد الإنتضار",
      date: 'dateUpdateWaite',
      isCompleted: false,
      color: Colors.orange,
      icon: Icons.sync,
      statusId: 1,
    ),
    OrderStatus(
      id: 2,
      name: "قيد المعالجة",
      date: 'dateUpdatePross',
      isCompleted: true,
      color: Colors.green,
      icon: Icons.local_shipping,
      statusId: 2,
    ),
    OrderStatus(
      id: 3,
      name: "قيد التنفيذ",
      date: 'implementationDate',
      isCompleted: false,
      color: Colors.purple,
      icon: Icons.delivery_dining,
      statusId: 3,
    ),
    OrderStatus(
      id: 4,
      name: "اكتمال",
      date: 'dateCompleted',
      isCompleted: false,
      color: Colors.teal,
      icon: Icons.home,
      statusId: 4,
    ),
    OrderStatus(
      id: 5,
      name: "مكتمل",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.green,
      icon: Icons.home,
      statusId: 5,
    ),
    OrderStatus(
      id: 6,
      name: "مرفوض",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.red,
      icon: Icons.inbox,
      statusId: 6,
    ),
    OrderStatus(
      id: 7,
      name: "ملغي",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.redAccent,
      icon: Icons.home,
      statusId: 7,
    ),
    OrderStatus(
      id: 8,
      name: "طلب استرداد",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.teal,
      icon: Icons.home,
      statusId: 8,
    ),
    OrderStatus(
      id: 9,
      name: "مرتجع",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.purple,
      icon: Icons.home,
      statusId: 9,
    ),
    OrderStatus(
      id: 10,
      name: "طلب تمت اعادتة",
      date: 'dateCompleted',
      isCompleted: true,
      color: Colors.purple,
      icon: Icons.home,
      statusId: 10,
    ),
  ];

  static OrderStatus getStatus(int id) => allStatus[id];
}

class PaymentStatus {
  final int id;
  final String name;
  final IconData icon;
  final Color color;

  PaymentStatus({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });

  static final _paymentStatus = [
    PaymentStatus(
      id: 0,
      name: 'غير مدفوع',
      icon: Icons.money_off,
      color: Colors.red,
    ),
    PaymentStatus(
      id: 1,
      name: 'إشعار دفع',
      icon: Icons.notifications,
      color: Colors.orange,
    ),
    PaymentStatus(
      id: 2,
      name: 'دفع غير مكتمل',
      icon: Icons.warning,
      color: Colors.yellow,
    ),
    PaymentStatus(
      id: 3,
      name: 'تم الدفع',
      icon: Icons.check_circle,
      color: Colors.green,
    ),
    PaymentStatus(
      id: 4,
      name: 'اشتراك',
      icon: Icons.card_membership,
      color: Colors.purple,
    ),
    PaymentStatus(
      id: 5,
      name: 'تم طلب الاسترداد',
      icon: Icons.request_quote,
      color: Colors.blueGrey,
    ),
    PaymentStatus(
      id: 6,
      name: 'تم الاسترداد',
      icon: Icons.undo,
      color: Colors.blue,
    ),
  ];

  static PaymentStatus getStatus(int id) =>
      _paymentStatus.firstWhere((e) => e.id == id);
}
