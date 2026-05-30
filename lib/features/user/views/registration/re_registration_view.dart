import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/services/snackbar_service.dart';
import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:amoora_mkt/cff/widgets/custom_statusbar_background.dart';
import 'package:amoora_mkt/cff/widgets/custom_upload.dart';
import 'package:amoora_mkt/cff/widgets/forms/group_list.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class ReRegistrationView extends StatelessWidget {
  const ReRegistrationView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      customStatusBarBackground: CustomStatusBarBackground(),
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(color: oBlack),
          title: Text('Formulir Daftar Ulang Mahasiswa').clr(oBlack),
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
                    CustomInput(hintText: 'Nama Mahasiswa :'),
                    15.height,
                    CustomInput(hintText: 'Nomor Induk Siswa Nasional (NISN) :'),
                    15.height,
                    CustomInput(hintText: 'Nomor Telephone :'),
                    15.height,
                    CustomUpload(
                      hintText: 'Upload Bukti Pembayaran UKT/Biaya Kuliah :',
                      desc: 'Drag & Drop Files here or Choose file Bukti Pembayaran UKT',
                      onTap: () => SnackBarService.show(message: 'Upload Bukti Pembayaran UKT/Biaya Kuliah'),
                    ),
                    15.height,
                    CustomUpload(
                      hintText: 'Upload Kartu Rencana Studi (KRS) Semester Sebelumnya :',
                      desc: 'Drag & Drop Files here or Choose file Bukti Kartu Rencana Studi (KRS)',
                      onTap: () =>
                          SnackBarService.show(message: 'Upload Kartu Rencana Studi (KRS) Semester Sebelumnya'),
                    ),
                    15.height,
                    CustomUpload(
                      hintText: 'Upload Surat Keterangan Bebas Perpustakaan :',
                      desc: 'Drag & Drop Files here or Choose file Bukti Bebas Perpustakaan',
                      onTap: () => SnackBarService.show(message: 'Upload Surat Keterangan Bebas Perpustakaan'),
                    ),
                    60.height,
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
