import 'package:get/get.dart';

class ProfileController extends GetxController {
  final List<Map<String, dynamic>> accountFeatureList = [
    {
      'icon': 'assets/icons/profile_history_check_icon.png',
      'label': 'Check History Order'
    },
    {'icon': 'assets/icons/profile_payment_icon.png', 'label': 'Payment'},
    {'icon': 'assets/icons/profile_voucher_icon.png', 'label': 'My Vouchers'},
    {
      'icon': 'assets/icons/profile_promo_icon.png',
      'label': 'Input Promo Code'
    },
    {'icon': 'assets/icons/profile_notif_icon.png', 'label': 'Notifications'},
    {
      'icon': 'assets/icons/profile_faq_icon.png',
      'label': 'Frequently Asked Question'
    },
  ];
}
