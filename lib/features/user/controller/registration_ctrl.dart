import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/features/user/views/registration/new_student_view.dart';
import 'package:amoora_mkt/features/user/views/registration/re_registration_view.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';

enum RegistrationType {
  type0('Pendaftaran Mahasiswa Baru'),
  type1('Daftar Ulang Semester Terbaru'),
  type2('Daftar Beasiswa'),
  type3('Daftar Program Magang'),
  type4('Daftar Kegiatan Organisasi/Ekstra Kulikuler Kampus'),
  type5('Daftar Sebagai Asisten Dosen');

  const RegistrationType(this.name);
  final String name;
}

class RegistrationCtrl {
  Ref ref;
  RegistrationCtrl(this.ref);

  void goto(RegistrationType type) async {
    switch (type) {
      case RegistrationType.type0:
        return ref.read(pageUtilsProvider).goto(page: NewStudentView());
      case RegistrationType.type1:
        return ref.read(pageUtilsProvider).goto(page: ReRegistrationView());
      case RegistrationType.type2:
      case RegistrationType.type3:
      case RegistrationType.type4:
      case RegistrationType.type5:
    }
  }
}

final registrationCtrlProvider = Provider(RegistrationCtrl.new);
