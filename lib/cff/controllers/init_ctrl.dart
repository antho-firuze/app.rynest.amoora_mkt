import 'package:amoora_mkt/cff/controllers/permission_ctrl.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/features/auth/views/signin_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/cff/controllers/network_ctrl.dart';
import 'package:amoora_mkt/features/auth/controller/auth_controller.dart';
import 'package:amoora_mkt/cff/utils/router.dart';

import '../services/sharedpref_service.dart';

final String _showWalkThroughKey = 'SHOW_WALKTHROUGH';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool(_showWalkThroughKey) ?? true;

  final bool _showWalkThrough;

  Future<bool> initApps() async {
    // Initialize Network
    ref.read(networkCtrlProvider).initialize();

    // Initialize Permissions
    ref.read(permissionCtrlProvider).initialize();

    // Check User authorized
    if (await ref.read(authCtrlProvider.notifier).isAuthorized() == false) {
      bool result = await ref.read(pageUtilsProvider).goto(page: SignInView(canPop: false));
      if (result == false) {
        return false;
      }
    }

    // Goto Next Route
    if (_showWalkThrough) {
      ref.read(goRouterProvider).go('/walkthrough');
      ref.read(sharedPrefProvider).setBool(_showWalkThroughKey, false);
    } else {
      ref.read(goRouterProvider).go('/home');
    }
    return true;
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
