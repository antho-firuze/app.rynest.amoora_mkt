import 'dart:io';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/utils/currency_utils.dart';
import 'package:amoora_mkt/cff/utils/data_type_utils.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_button.dart';
import 'package:amoora_mkt/cff/widgets/button/custom_iconbutton.dart';
import 'package:amoora_mkt/cff/widgets/cross_paint.dart';
import 'package:amoora_mkt/cff/widgets/custom_badge.dart';
import 'package:amoora_mkt/cff/widgets/custom_icon.dart';
import 'package:amoora_mkt/cff/widgets/custom_interactive_viewer.dart';
import 'package:amoora_mkt/cff/widgets/custom_rating_star.dart';
import 'package:amoora_mkt/cff/widgets/logo/app_logo.dart';
import 'package:amoora_mkt/cff/widgets/one_ui/one_ui_nested_scroll_view.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/utils/download_utils.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/features/product/controller/product_ctrl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

class ProductDetailView extends ConsumerWidget {
  const ProductDetailView({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fetchImage = ref.watch(
      fetchImageProvider(Reqs(url: data['image'], fileKey: "${data['id']}_${data['type']}")),
    );
    return MyUI(
      child: Scaffold(
        floatingActionButton: CustomIconButton(
          padding: EdgeInsets.all(12),
          icon: Icon(SuperIcons.bs_share, color: oWhite),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          color: const Color(0xFFD06B0D),
          onPressed: () async {
            return await ref
                .read(productCtrlProvider)
                .share(
                  text: 'Paket ${data.toStr('type').toCamelCase()} Amoora Travel',
                  filename: "${data['id']}_${data['type']}",
                );
          },
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Harga Mulai').tsBody().clr(primaryLight.withAlpha(150)),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Rp ${data.toDouble('price_quad').toCurrency()}").tsTitle().bold().clr(primaryLight),
                        Text('per pax • Kamar Quad').tsCaption().clr(primaryLight.withAlpha(150)),
                      ],
                    ),
                  ],
                ),
              ),
              10.height,
              CustomButton(
                icon: Icon(Icons.checklist, size: 15),
                child: Text('Pesan Sekarang').bold(),
                onPressed: () => context.goto(
                  page: fetchImage.when(
                    data: (data) => CustomInteractiveViewer(child: Image.file(File(data))),
                    error: (error, stackTrace) => Container(),
                    loading: () => const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ],
          ),
        ),
        persistentFooterButtons: [],
        body: OneUINestedScrollView(
          foregroundColor: oWhite,
          background: fetchImage.when(
            data: (data) {
              return Container(
                decoration: BoxDecoration(
                  image: DecorationImage(image: FileImage(File(data)), fit: BoxFit.cover),
                ),
              );
            },
            error: (error, stackTrace) {
              return SizedBox.expand(
                child: CustomPaint(
                  painter: CrossPaint(color: oBlack50),
                  child: Center(child: Text('Image Not Available').tsCaption().center()),
                ),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
          expandedWidget: SizedBox(
            width: 150,
            child: CustomButton(
              bgColor: oWhite.withAlpha(100),
              child: Text('Lihat Brosur').bold(),
              onPressed: () => context.goto(
                page: fetchImage.when(
                  data: (data) => CustomInteractiveViewer(child: Image.file(File(data))),
                  error: (error, stackTrace) => Container(),
                  loading: () => const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
          collapsedWidget: Text(
            'Paket ${data.toStr('type').toCamelCase()} Amoora Travel',
          ).tsHeadline().bold().ellipsis().clr(oWhite),
          actions: [
            // FavoriteButton(
            //   // isFavorite: item?.isFavorite ?? false,
            //   // onPressed: ref.read(travelsProvider.notifier).toggleFavorite,
            // ),
            // ShareButton(),
            // CustomIconButton( 
            //   icon: Icon(SuperIcons.bs_share, color: oWhite),
            //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            //   color: primaryDark.withAlpha(130),
            //   hasNotif: true,
            //   onPressed: () => null,
            // ),
            // DarkModeButton(),
          ],
          onRefresh: () async => await Future.value(),
          sliverList: SliverList.list(
            children: [
              // HEADER
              ProductHeaderWidget(data: data),
              10.height,
              // BODY
              ScheduleWidget(data: data),
              15.height,
              AccomodationWidget(data: data),
              15.height,
              FacilitiesWidget(data: data),
              15.height,
              DisclaimerWidget(),
              15.height,
            ],
          ),
        ),
      ),
    );
  }
}

class ProductHeaderWidget extends StatelessWidget {
  const ProductHeaderWidget({
    super.key,
    required this.data,
  });

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(color: primaryLight.withAlpha(30)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomBadge(
                data.toStr('badge').toCamelCase(),
                icon: Icons.star,
                backgroundColor: data.toStr('badge_color').toColor(),
              ),
              10.width,
              CustomBadge(data.toStr('type').toCamelCase(), icon: Icons.mosque),
            ],
          ),
          10.height,
          Text(data.toStr('name')).tsHeadline(scale: 1.2).bold(),
        ],
      ),
    );
  }
}

class DisclaimerWidget extends StatelessWidget {
  const DisclaimerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: primaryLight.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryLight.withAlpha(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppLogo(width: 200),
            10.height,
            Text('PT Zhafeela Rabbani Wisata').tsBody(),
            20.height,
            Row(
              children: [
                Icon(Icons.verified, size: 15, color: Colors.green),
                10.width,
                Text('Izin resmi dari Kementerian Agama RI').tsBody().center(),
              ],
            ),
            10.height,
            Row(
              children: [
                Icon(Icons.shield, size: 15, color: Colors.blue),
                10.width,
                Text('Pembayaran aman & terjamin').tsBody().center(),
              ],
            ),
            10.height,
            Row(
              children: [
                Icon(Icons.support_agent, size: 15, color: Colors.purple),
                10.width,
                Text('Layanan 24/7 siap membantu').tsBody().center(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FacilitiesWidget extends StatelessWidget {
  const FacilitiesWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    // List<String> facilities = data.toListString('facilities');
    // if (facilities.isEmpty) return Container();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryLight.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryLight.withAlpha(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomIcon(SuperIcons.cl_checkbox_list_line, tooltip: 'Fasilitas', color: Colors.green),
                10.width,
                Text('Fasilitas Paket').tsTitle().bold(),
              ],
            ),
            20.height,
            OrientationBuilder(
              builder: (context, orientation) {
                return GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisExtent: 300,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(SuperIcons.ii_checkbox, size: 20, color: Colors.green),
                            10.width,
                            Text('SUDAH TERMASUK').bold().clr(Colors.green),
                          ],
                        ),
                        10.height,
                        ...data
                            .toListString('includes')
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.check, size: 15, color: Colors.green),
                                    10.width,
                                    Expanded(child: Text("$e")),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(SuperIcons.ev_close_square, size: 20, color: Colors.red),
                            10.width,
                            Text('BELUM TERMASUK').bold().clr(Colors.red),
                          ],
                        ),
                        10.height,
                        ...data
                            .toListString('excludes')
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Icon(Icons.close, size: 15, color: Colors.red),
                                    10.width,
                                    Expanded(child: Text("$e")),
                                  ],
                                ),
                              ),
                            )
                            .toList(),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccomodationWidget extends StatelessWidget {
  const AccomodationWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    String catering = switch (data.toStr('hotel_madinah_meal').toLowerCase()) {
      'fb' => 'Full Board',
      'half-board' => 'Half Board',
      'non-fb' => 'No Meal',
      _ => data.toStr('hotel_madinah_meal'),
    };
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryLight.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryLight.withAlpha(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomIcon(SuperIcons.hr_building_office, tooltip: 'Akomodasi', color: const Color(0xFFAE3F16)),
                10.width,
                Text('Akomodasi Hotel').tsTitle().bold(),
              ],
            ),
            20.height,
            // Add accommodation details here
            OrientationBuilder(
              builder: (context, orientation) {
                return GridView(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisExtent: 170,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.brown.withAlpha(30),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.layers, color: Color(0xFFAE3F16)),
                              20.width,
                              Text('MAKKAH').clr(Color(0xFFAE3F16)).bold(),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(color: primaryLight.withAlpha(30)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.height,
                              Text(data.toStr('hotel_makkah')).tsTitle().bold(),
                              10.height,
                              CustomRatingStar(rating: data.toDouble('hotel_makkah_stars')),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Lama Menginap'),
                                  Text("${data.toInt('hotel_makkah_nights')} Malam").bold(),
                                ],
                              ),
                              5.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text('Katering'), Text("${catering}").bold().clr(Colors.green)],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.green.withAlpha(30),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.mosque, color: Colors.green),
                              20.width,
                              Text('MADINAH').clr(Colors.green).bold(),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                            ),
                            border: Border.all(color: primaryLight.withAlpha(30)),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.height,
                              Text(data.toStr('hotel_madinah')).tsTitle().bold(),
                              10.height,
                              CustomRatingStar(rating: data.toDouble('hotel_madinah_stars')),
                              10.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Lama Menginap'),
                                  Text("${data.toInt('hotel_madinah_nights')} Malam").bold(),
                                ],
                              ),
                              5.height,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [Text('Katering'), Text("${catering}").bold().clr(Colors.green)],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class ScheduleWidget extends StatelessWidget {
  const ScheduleWidget({super.key, required this.data});

  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: primaryLight.withAlpha(10),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: primaryLight.withAlpha(30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CustomIcon(Icons.calendar_month, tooltip: 'Jadwal Perjalanan', color: primaryLight),
                10.width,
                Text('Jadwal Perjalanan').tsTitle().bold(),
              ],
            ),
            20.height,
            OrientationBuilder(
              builder: (context, orientation) {
                return GridView(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 600,
                    mainAxisExtent: 65,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 20,
                  ),
                  // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  //   crossAxisCount: 1.whenLandscapeInt(2),
                  //   childAspectRatio: 5.whenLandscape(6)!,
                  //   mainAxisSpacing: 10,
                  //   crossAxisSpacing: 20,
                  // ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ScheduleItem(
                      title: 'Keberangkatan',
                      value: data.toDateTime('departure_date')?.yMMMMd() ?? '-',
                      icon: Icon(Icons.flight_takeoff, size: 15, color: primaryLight),
                    ),
                    ScheduleItem(
                      title: 'Durasi',
                      value: '${data.toInt('duration')} Hari',
                      icon: Icon(Icons.timer, size: 15, color: Colors.deepPurple),
                    ),
                    ScheduleItem(
                      title: 'Maskapai',
                      value: data.toStr('airline'),
                      icon: Icon(Icons.airplanemode_active, size: 15, color: Colors.redAccent),
                    ),
                    if (data.toStr('program_note').isNotEmpty)
                      ScheduleItem(
                        title: 'Catatan Program',
                        value: data.toStr('program_note'),
                        icon: Icon(Icons.route, size: 15, color: Colors.green),
                      ),
                  ],
                );
              },
            ),
            ListDepartures(data: [data.toDateTime('departure_date'), ...data.toListDateTime('departure_dates')]),
            ListFlights(data: data.toListString('flights')),
          ],
        ),
      ),
    );
  }
}

class ListDepartures extends StatelessWidget {
  const ListDepartures({super.key, required this.data});

  final List<DateTime?> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty || data.length < 2) return Container();

    return Column(
      children: [
        10.height,
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: primaryLight.withAlpha(30),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            border: Border.all(color: primaryLight.withAlpha(30)),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.calendar_month, size: 15, color: primaryLight),
              5.width,
              Text('SEMUA PILIHAN JADWAL KEBERANGKATAN').bold(),
            ],
          ),
        ),
        OrientationBuilder(
          builder: (context, orientation) {
            return Container(
              // padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryLight.withAlpha(30),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                border: Border.all(color: primaryLight.withAlpha(30)),
              ),
              child: GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 220,
                  mainAxisExtent: 50,
                  // mainAxisSpacing: 10,
                  // crossAxisSpacing: 20,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      // color: primaryLight.withAlpha(30),
                      // borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: primaryLight.withAlpha(30)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('JADWAL ${index + 1}'),
                        Text(data[index]?.custom('EEEE, d MMM yyyy') ?? '-').tsLabel().bold(),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class ListFlights extends StatelessWidget {
  const ListFlights({super.key, required this.data});

  final List<String> data;

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) return Container();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        divider(padding: EdgeInsets.only(top: 20, bottom: 20)),
        Text('DETAIL PENERBANGAN'),
        10.height,
        OrientationBuilder(
          builder: (context, orientation) {
            return GridView.builder(
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 600,
                mainAxisExtent: 55,
                mainAxisSpacing: 10,
                crossAxisSpacing: 20,
              ),
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                Icon icon = Icon(Icons.flight_takeoff, size: 15, color: primaryLight);
                if (index == 0) {
                  icon = Icon(Icons.flight_takeoff, size: 15, color: Colors.red);
                } else if (index == data.length - 1) {
                  icon = Icon(Icons.flight_land, size: 15, color: Colors.green);
                } else {
                  icon = Icon(Icons.flight, size: 15, color: primaryLight);
                }
                return Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: primaryLight.withAlpha(30),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: primaryLight.withAlpha(30)),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 20, child: icon),
                      10.width,
                      Expanded(child: Text(data[index]).tsLabel().bold()),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}

class ScheduleItem extends StatelessWidget {
  const ScheduleItem({super.key, required this.title, required this.value, this.icon});

  final String title;
  final String value;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: primaryLight.withAlpha(30),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryLight.withAlpha(30)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              if (icon != null) ...[SizedBox(width: 20, child: icon), 5.width],
              // Icon(icon ?? Icons.circle, size: 15, color: primaryLight),
              Text(title.toUpperCase()).tsLabel().bold().clr(primaryLight.withAlpha(200)),
            ],
          ),
          5.height,
          if (value.isEmpty) Container() else Text(value.toCamelCase()).tsLabel().bold(),
        ],
      ),
    );
  }
}
