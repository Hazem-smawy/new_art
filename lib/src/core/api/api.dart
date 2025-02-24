class AppLink {
  static const String server = "https://ycic-ye.com/api/";
  static const String login = "${server}login";
  static const String getPoints = "${server}get_user_points";
  static const String home = "${server}home";
  static const String register = "${server}register";
  static const String storeorder = "${server}orders/store";
  static const String getCatiegory = "${server}orders/create";
  static const String getOurBank = "${server}banks/accounts";
  static const String getOurBusiness = "${server}product";
  static const String getPackages = "${server}pricing";
  static const String getOrderIndex = "${server}orders/index";
  static const String getFaqs = "${server}faq";
  static const String getAbout = "${server}abouts";
  static const String getPayments = "${server}payments";
  static const String getPaymentsAll = "${server}payment/create/bankaccount";
  static const String createOrderPayment = "${server}payment/create/";
  static const String getExclusive = "${server}exclusive";
  static const String logout = "${server}logout";
  static const String updateOrder = "${server}orders/update/";
  static const String postModificationOrder =
      "${server}order_modification/store/";

  static const String postPaymentTransfer = "${server}payment/store/";
  static const String getOrderTypes = '${server}orders/ordertype';

  ///api/orders/create
}
