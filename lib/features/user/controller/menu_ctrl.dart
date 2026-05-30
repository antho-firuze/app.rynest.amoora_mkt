import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/features/user/views/registration/registration_view.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';

class MenuCtrl {
  Ref ref;
  MenuCtrl(this.ref);

  List<AppMenu> getHomeAppMenus() {
    final appMenus = AppMenu.values;

    return appMenus;

    // List<Map<String, Object>> appMenusJson = ref.read(menuServiceProvider).getAppMenus();
    // List<AppMenu> appMenus = appMenusJson.map(AppMenu.fromJson).toList();

    // // NOT SIGNIN
    // // if (ref.read(authUserProvider) == null) {
    // //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes"];
    // //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    // //   return appMenus;
    // // }

    // // AFTER SIGNIN
    // // appMenus = _filterMenuByRole(appMenus);

    // // FILTER WHERE DEFAULT == TRUE
    // appMenus.removeWhere((element) => element.isDefault == false);

    // return appMenus;
  }

  List<AppMenu> getAllAppMenus() {
    List<AppMenu> appMenus = AppMenu.values;

    // NOT SIGNIN
    // if (ref.read(authUserProvider) == null) {
    //   final homeMenuList = ["quran", "prayers", "jelajah", "prayerTimes", "exchangeRate", "qibla"];
    //   appMenus.removeWhere((element) => !homeMenuList.contains(element.code));
    //   return appMenus;
    // }

    // AFTER SIGNIN
    // appMenus = _filterMenuByRole(appMenus);

    // FILTER WHERE SHOW == TRUE
    // appMenus.where((element) => element.isShow == true).toList();

    return appMenus;
  }

  List<AppMenu> _filterMenuByRole(List<AppMenu> menus) {
    // Role 1 => Jama'ah
    // if (ref.read(authUserProvider)?.roleId == 1) {
    //   menus.removeWhere((element) => element.code == 'liveLocation');
    //   menus.removeWhere((element) => element.code == 'presenter');
    //   menus.removeWhere((element) => element.code == 'agenda');
    // }
    // Role 2 => Muthowwif
    // if (ref.read(authUserProvider)?.roleId == 2) {
    //   menus.removeWhere((element) => element.code == 'listener');
    // }
    return menus;
  }

  // String getIconPath(String code) {
  //   return switch (code) {
  //     "treatment" => 'assets/icons/menu/ic-treatment.png',
  //     "appointment" => 'assets/icons/menu/ic-appointment.png',
  //     "records" => 'assets/icons/menu/ic-records.png',
  //     "doctor" => 'assets/icons/menu/ic-doctor.png',
  //     "tele_dentistry" => 'assets/icons/menu/ic-tele_dentistry.png',
  //     "facility" => 'assets/icons/menu/ic-facility.png',
  //     "nurse" => 'assets/icons/menu/ic-nurse.png',
  //     "history" => 'assets/icons/menu/ic-history.png',
  //     "setting" => 'assets/icons/menu/ic-setting.png',
  //     String() => '',
  //   };
  // }

  Future goto(String code) async {
    return switch (code) {
      "00" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "01" => ref.read(pageUtilsProvider).go('/participant'),
      "02" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "03" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "04" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "05" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "06" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      "07" => await ref.read(pageUtilsProvider).goto(page: const RegistrationView()),
      String() => '',
    };
  }
}

final menuCtrlProvider = Provider(MenuCtrl.new);

enum AppMenu {
  menu0('00', 'Daftar Mandiri', '', 'ic-registration.png'),
  menu1('01', 'Data Peserta', '', 'ic-members.png'),
  menu2('02', 'Data Marketing', '', 'ic-marketing.png'),
  menu3('03', 'Komisi', '', 'ic-wallet.png');
  // menu4('04', 'Event', '', 'ic-event.png'),
  // menu5('05', 'Artikel', '', 'ic-article.png'),
  // menu6('06', 'Kalender Akademik', '', 'ic-calendar.png'),
  // menu7('07', 'Lainnya', '', 'ic-etc.png');

  const AppMenu(this.code, this.name, this.desc, this.image);
  final String code;
  final String name;
  final String desc;
  final String image;
}
