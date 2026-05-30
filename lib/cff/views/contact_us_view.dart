import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:super_icons/super_icons.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsView extends StatelessWidget {
  const ContactUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: const Text('Hubungi Kami')),
        body: RefreshIndicator(
          onRefresh: () async {},
          child: ListView(
            children: [
              20.height,
              // Padding(
              //   padding: const EdgeInsets.only(left: 16),
              //   child: Text('Kantor Pusat').tsHeadlineS().bold(),
              // ),
              // 10.height,
              // ListTile(
              //   title: Text('Alamat'),
              //   subtitle: Text(
              //           'Jl. Gatot Subroto No.Kav 56, RT.1/RW.4, Kuningan Tim., Kecamatan Setiabudi, Kota Jakarta Selatan, Daerah Khusus Ibukota Jakarta 12950'
              //               )
              //       .tsBodyM()
              //       .bold(),
              //   trailing: const Icon(Iconsax.map_copy),
              //   onTap: () => launchUrl(
              //     mode: LaunchMode.externalApplication,
              //     Uri.parse(
              //         'https://www.google.com/maps/search/?api=1&query=-6.238997857657202%2C106.83224425549815&query_place_id=ChIJ0csG98LzaS4R8AdnI8_YGrc'),
              //   ),
              // ),
              // 30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('PT. Zhafeela Rabbani Wisata (Amoora Travel)').tsHeadline().bold(),
              ),
              10.height,
              ListTile(
                title: Text('Alamat'),
                subtitle: Text(
                  'Jl. Tole Iskandar No. 11, Sukmajaya, Kec. Sukmajaya, Kota Depok, Jawa Barat 16412',
                ).tsBody().bold(),
                trailing: const Icon(SuperIcons.is_map_outline),
                onTap: () => launchUrl(
                  mode: LaunchMode.externalApplication,
                  Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=-6.405185377767814%2C106.84855663558108&query_place_id=ChIJa-ovOxPraS4RtNCyb6GneFA',
                  ),
                ),
              ),
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 24),
                child: Stack(
                  children: [
                    Text('Customer Care Amoora').tsHeadline().bold(),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () => showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18),
                            ),
                          ),
                          builder: (context) {
                            return MyUI(
                              isTransparent: true,
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CloseButton(onPressed: () => context.pop()),
                                      ),
                                      // const Align(
                                      //   alignment: Alignment.center,
                                      //   child: Padding(
                                      //     padding: EdgeInsets.fromLTRB(10, 12, 10, 0),
                                      //     child: Text('Note'),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                  10.height,
                                  const Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text('Note: '),
                                        Text('- Online setiap hari (08:00 - 20:00)'),
                                        Text('- Senin - Jumat (08:00 - 18:00)'),
                                      ],
                                    ),
                                  ),
                                  20.height,
                                ],
                              ),
                            );
                          },
                        ),
                        child: const Icon(Icons.info),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(SuperIcons.ev_phone_call),
                title: Text('Phone #1'),
                subtitle: Text('0823 1134 0044').tsBody().bold(),
                trailing: GestureDetector(
                  onTap: () => Uri.parse(
                    'https://wa.me/+6282311340044/?text=${Uri.encodeComponent("Assalamu'alaikum Amoora,")}',
                  ),
                  child: const Icon(SuperIcons.is_whatsapp_outline),
                ),
                onTap: () => launchUrl(Uri.parse('tel:+6282311340044')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.ev_phone_call),
                title: Text('Phone #2'),
                subtitle: Text('0823 1134 0011').tsBody().bold(),
                trailing: GestureDetector(
                  onTap: () => Uri.parse(
                    'https://wa.me/+6282311340011/?text=${Uri.encodeComponent("Assalamu'alaikum Amoora,")}',
                  ),
                  child: const Icon(SuperIcons.is_whatsapp_outline),
                ),
                onTap: () => launchUrl(Uri.parse('tel:+6282311340011')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.bs_envelope_open),
                title: Text('Email'),
                subtitle: Text('customerservice@amoora.id').tsBody().bold(),
                onTap: () => launchUrl(Uri.parse('mailto:customerservice@amoora.id')),
              ),
              30.height,
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text('Follow Akun Sosial Media Kami').tsHeadline().bold(),
              ),
              10.height,
              ListTile(
                leading: const Icon(SuperIcons.is_instagram_outline),
                title: Text('Instagram').bold(),
                onTap: () => launchUrl(Uri.parse('https://www.instagram.com/amoora_official/')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.mg_tiktok_fill),
                title: Text('Tik Tok').bold(),
                onTap: () => launchUrl(Uri.parse('https://www.tiktok.com/@amooraofficial')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.mg_facebook_fill),
                title: Text('Facebook').bold(),
                onTap: () => launchUrl(Uri.parse('https://www.facebook.com/@amooraidofficial')),
              ),
              ListTile(
                leading: const Icon(SuperIcons.mg_twitter_fill),
                title: Text('X (Twitter)').bold(),
                onTap: () => launchUrl(Uri.parse('https://www.twitter.com/@amooraofficial')),
              ),
              30.height,
            ],
          ),
        ),
      ),
    );
  }
}
