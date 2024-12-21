import 'package:get/get.dart';
import 'package:myapp/app/modules/views/Cod_View.dart';
import '../modules/bindings/home_binding.dart';
import '../modules/bindings/makanan_binding.dart';
import '../modules/bindings/sembako_binding.dart';
import '../modules/bindings/sayuran_binding.dart';
import '../modules/bindings/activity_binding.dart';
import '../modules/bindings/cart_binding.dart'; 
import '../modules/bindings/checkout_binding.dart'; 
import '../modules/bindings/Cod_binding.dart'; 
import '../modules/bindings/welcome_binding.dart'; // Tambahkan binding untuk Welcome
import '../modules/views/home_view.dart';
import '../modules/views/makanan_view.dart';
import '../modules/views/sembako_view.dart';
import '../modules/views/sayuran_view.dart';
import '../modules/views/activity_view.dart';
import '../modules/views/cart_view.dart'; 
import '../modules/views/promo_view.dart'; 
import '../modules/views/accounts_view.dart'; 
import '../modules/views/favorites_view.dart'; 
import '../modules/views/checkout_view.dart'; 
import '../modules/views/welcome_view.dart'; // Tambahkan halaman WelcomeView

class AppRoutes {
  static const welcome = '/welcome';  // Tambahkan rute Welcome
  static const home = '/home';
  static const makanan = '/makanan';
  static const sembako = '/sembako';
  static const sayuran = '/sayuran';
  static const activity = '/activity';
  static const promo = '/promo';
  static const accounts = '/accounts';
  static const cart = '/cart';
  static const favorites = '/favorites';
  static const cod = '/cod'; 
  static const checkout = '/checkout'; 

  static final routes = [
    GetPage(name: welcome, page: () => const WelcomeView(), binding: WelcomeBinding()),  // Rute Welcome
    GetPage(name: home, page: () => const HomeView(), binding: HomeBinding()),
    GetPage(name: makanan, page: () => const MakananView(), binding: MakananBinding()),
    GetPage(name: sembako, page: () => const SembakoView(), binding: SembakoBinding()),
    GetPage(name: sayuran, page: () => const SayuranView(), binding: SayuranBinding()),
    GetPage(name: activity, page: () => const ActivityView(), binding: ActivityBinding()),
    GetPage(name: cart, page: () => const CartView(), binding: CartBinding()),
    GetPage(name: promo, page: () => const PromoView()),
    GetPage(name: accounts, page: () => const AccountsView()),
    GetPage(name: favorites, page: () => const FavoritesView()),
    GetPage(name: cod, page: () => const CodView(), binding: CodBinding()), 
    GetPage(name: checkout, page: () => const CheckoutView(), binding: CheckoutBinding()),
  ];
}
