String getPaymentStatus(String transaction) {
  String result;

  int transactionInt = int.tryParse(transaction) ?? -1;

  switch (transactionInt) {
    case 0:
      result = 'غير مدفوع';
      break;
    case 1:
      result = 'إشعار دفع';
      break;
    case 2:
      result = 'دفع غير مكتمل';
      break;
    case 3:
      result = 'مدفوع';
      break;
    case 4:
      result = 'اجل';
      break;
    case 5:
      result = 'نقاطي';
      break;
    case 6:
      result = 'أشتراك';
      break;
    case 7:
      result = 'طلب استرداد';
      break;
    case 8:
      result = 'تمت إعاده الاموال';
      break;
    default:
      result = 'غير معروف';
  }

  return result;
}
