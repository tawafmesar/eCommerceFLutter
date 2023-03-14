class ApiPath {
  static String products() => 'products/';
  static String user(String uid) => 'users/$uid';
   static String deliveryMethods() => 'deliveryMethod/';
  static String addToCart(String uid,String addToCartId) => 'users/$uid/cart/$addToCartId';
  static String myProductsCart(String uid) => 'users/$uid/cart/';

}
