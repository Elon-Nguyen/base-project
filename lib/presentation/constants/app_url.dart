class AppUrl {
  static const String url = 'https://jsonplaceholder.typicode.com/';

  static const String version = '';

  static String refreshToken(String? refreshTokenValue) =>
      'refresh_token/$refreshTokenValue';

  static const String login = 'login';
  static const String productList = 'product/list/';
  static String orderPaymentCardUpdate(int id) => 'payment/card/patch/$id';
  static String orderPaymentCardDelete(int id) =>
      'payment/card/delete/?ids=$id';
}
