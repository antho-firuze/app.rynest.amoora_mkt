import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

import '../widgets/one_ui/one_ui_nested_scroll_view.dart';

class AboutView extends StatelessWidget {
  const AboutView({super.key});

  static const routeName = '/about';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      enabledSafeArea: false,
      child: Scaffold(
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          expandedWidget: Text('Penasaran dengan AMOORA?').tsHeadline().center().clr(oWhite),
          collapsedWidget: Text('Penasaran dengan AMOORA?').tsTitle().ellipsis().clr(oWhite).maxLn(1),
          background: Container(
            decoration: const BoxDecoration(
              color: Colors.brown,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              image: DecorationImage(image: AssetImage('assets/images/background-02.jpg'), fit: BoxFit.cover),
            ),
          ),
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
            // IconButton(
            //   onPressed: () {},
            //   icon: const Icon(Icons.search),
            // ),
          ],
          sliverList: SliverList.list(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Profil Amoora Travel').tsHeadline().bold(),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Perjalanan Ibadah Dengan Kenyamanan Terbaik'),
              ),
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  "PT Zhafeela Rabbani Wisata berdiri tahun 2014 sebagai salah satu perusahaan "
                  "yang bergerak dibidang jasa penyelenggara ibadah umroh & haji dengan nama Amoora Travel. "
                  "PT Zhafeela Rabbani Wisata (Amoora) telah memiliki izin resmi sebagai Penyelenggara "
                  "Perjalanan Ibadah Umroh (PPIU).",
                ).justify(),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  "Amoora mempunyai team yang telah berpengalaman melayani jamaah umroh dan haji. "
                  "Latar belakang terbentuknya Amoora Travel itu sendiri untuk mempermudah Jamaah yang ingin "
                  "melaksanakan ibadah Umroh & Haji.",
                ).justify(),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  "Dengan kehadiran Amoora sebagai penyelegara travel yang amanah dan terpercaya, "
                  "kami ingin agar Jamaah semua dapat beribadah dengan tenang dan khusyuk.",
                ).justify(),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  "Amoora juga bekerja sama dengan Perbankan Syariah serta Lembaga Pembiayaan Syariah.",
                ).justify(),
              ),

              // VISI & MISI
              30.height,
              Padding(padding: const EdgeInsets.only(left: 16), child: Text('VISI dan MISI').tsHeadline().bold()),
              const Padding(
                padding: EdgeInsets.only(left: 16),
                child: Text('Impian dan Cita-cita yang dimiliki Amoora'),
              ),
              30.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-vision.png'))),
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  '"Visi kami adalah menjadikan perusahaan jasa travel terkemuka di Indonesia '
                  'yang menggunakan sistem yang berbasis teknologi."',
                ).justify(),
              ),
              30.height,
              Center(child: SizedBox(height: 70, child: Image.asset('assets/icons/ic-mission.png'))),
              10.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: const Text(
                  '"Misi kami yaitu Berkomitmen tinggi untuk memberikan pelayanan yang prima, '
                  'meningkatkan kompetensi dan sumber daya manusia yang profesional, '
                  'memahami kebutuhan jamaah dan mengutamakan kepuasan jamaah."',
                ).justify(),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
