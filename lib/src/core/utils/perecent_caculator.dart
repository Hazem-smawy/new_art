String formatDiscountPercentage(double discount, double totalPrice) {
  // Ensure totalPrice is not zero to avoid division by zero error
  if (totalPrice == 0) return '0.00%';

  // Calculate and format the discount percentage
  double discountPercentage = (discount / totalPrice) * 100;
  return '${discountPercentage.toStringAsFixed(2)}%';
}

double rateToPercent(double part, double totalPrice) {
  // Ensure totalPrice is not zero to avoid division by zero error
  if (totalPrice == 0) return 0.00;

  // Calculate and format the discount percentage
  double discountPercentage = (part / totalPrice) * 100;
  String res = discountPercentage.toStringAsFixed(2);
  return double.parse(res);
}

double percentToRate(double percent, double totalPrice) {
  // Ensure totalPrice is not zero to avoid division by zero error
  if (totalPrice == 0) return 0.00;

  // Calculate and format the discount percentage
  double discountPercentage = (percent * totalPrice) / 100;
  String res = discountPercentage.toStringAsFixed(2);
  return double.parse(res);
}
