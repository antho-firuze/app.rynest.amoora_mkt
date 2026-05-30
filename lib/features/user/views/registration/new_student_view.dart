import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/custom_combo.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/cff/widgets/custom_statusbar_background.dart';
import 'package:amoora_mkt/cff/widgets/forms/group_list.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class NewStudentView extends StatelessWidget {
  const NewStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      customStatusBarBackground: CustomStatusBarBackground(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: oBlack),
          title: Text('Pendaftaran Mahasiswa Baru').clr(oBlack),
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(preferredSize: Size.fromHeight(1), child: divider(thick: .5)),
        ),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GroupList(
                  title: Text('Identitas Pendaftar'),
                  children: [
                    CustomInput(hintText: 'Nama sesuai identitas :'),
                    15.height,
                    CustomInput(hintText: 'Nomor Induk Siswa Nasional (NISN) :'),
                    15.height,
                    Row(
                      children: [
                        SizedBox(
                          width: context.screenWidth / 2 - 20,
                          child: CustomCombo(hintText: 'Jenis Kelamin :', type: ComboType.gender),
                        ),
                        10.width,
                        Expanded(
                          child: CustomCombo(hintText: 'Agama :', type: ComboType.religion),
                        ),
                      ],
                    ),
                    15.height,
                    CustomInput(hintText: 'Alamat lengkap :'),
                    15.height,
                    CustomInput(hintText: 'Kota :'),
                    15.height,
                    CustomInput(hintText: 'Kabupaten :'),
                    15.height,
                    CustomInput(hintText: 'Nomor Telephone :'),
                  ],
                ),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GroupList(
                  title: Text('Biodata Asal Sekolah'),
                  children: [
                    CustomInput(hintText: 'Nama Sekolah :'),
                    15.height,
                    CustomInput(hintText: 'Nomor Pokok Sekolah Nasional (NPSN) :'),
                  ],
                ),
              ),
              60.height,
            ],
          ),
        ),
      ),
    );
  }
}
