import 'dart:ui';

import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:amoora_mkt/cff/widgets/custom_appbar_background.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:super_icons/super_icons.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  static const routeName = '/dashboard';

  @override
  Widget build(BuildContext context) {
    return MyUI(
      customAppBarBackground: CustomAppBarBackground(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          titleSpacing: 30,
          title: const Text('Dashboard'),
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
        ),
        body: RefreshIndicator(
          onRefresh: () async => await Future.delayed(Duration(seconds: 2)),
          child: ListView(
            children: [
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  mainAxisExtent: 200,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    IslandWidget(
                      icon: Icon(SuperIcons.is_profile_2user_bold),
                      color: Colors.green,
                      title: Text('Total Jamaah'),
                      subTitle: Text('0 pemesanan total'),
                      value: Text('0'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.bs_receipt),
                      color: Colors.orange,
                      title: Text('Pending Booking'),
                      subTitle: Text('0 sudah bayar'),
                      value: Text('0'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.lc_heartHandshake),
                      color: Colors.purple,
                      title: Text('Partner ATP'),
                      subTitle: Text('mitra aktif saat ini'),
                      value: Text('0'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.is_profile_2user_bold),
                      color: Colors.blue,
                      title: Text('Paket Aktif'),
                      subTitle: Text('dari 8 paket'),
                      value: Text('8'),
                    ),

                    IslandWidget(
                      icon: Icon(SuperIcons.mg_news_fill),
                      color: Colors.red,
                      title: Text('Artikel Blog'),
                      subTitle: Text('konten edukasi aktif'),
                      value: Text('9'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.bx_discount_solid),
                      color: Colors.amber,
                      value: Text('0'),
                      title: Text('Voucher'),
                      subTitle: Text('kode aktif tersedia'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.bs_wallet),
                      color: Colors.brown,
                      value: Text('Rp 0'),
                      title: Text('Saldo Tabungan'),
                      subTitle: Text('total dan jamaah'),
                    ),
                    IslandWidget(
                      icon: Icon(SuperIcons.bx_money),
                      color: Colors.indigo,
                      value: Text('Rp 0'),
                      title: Text('Pendapatan'),
                      subTitle: Text('transaksi lunas'),
                    ),
                  ],
                ),
              ),
              20.height,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GridView.count(
                  padding: EdgeInsets.zero,
                  mainAxisExtent: 160,
                  crossAxisCount: 1,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    StripWidget(
                      value: Text('Rp 0'),
                      title: Text('Total Pendapatan (Lunas)'),
                      icon: Icon(SuperIcons.bx_money_withdraw),
                      color: Colors.blue,
                    ),
                    StripWidget(
                      value: Text('Rp 10'),
                      title: Text('Menunggu Pembayaran'),
                      icon: Icon(SuperIcons.bx_time_solid),
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              20.height,
            ],
          ),
        ),
      ),
    );
  }
}

class StripWidget extends StatelessWidget {
  const StripWidget({super.key, required this.value, required this.icon, required this.title, required this.color});

  final Widget value;
  final Widget icon;
  final Widget title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.blue, width: 5)),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 5.0,
            blurStyle: BlurStyle.outer,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color: color.withAlpha(100), borderRadius: BorderRadius.circular(16)),
                child: (icon as Icon).clr(color),
              ),
              10.width,
              (title as Text).tsTitle().bold().clr(color.withGreen(150)),
            ],
          ),
          20.height,
          (value as Text).size(40).bold().clr(color.withValues(colorSpace: ColorSpace.extendedSRGB)),
        ],
      ),
    );
  }
}

class IslandWidget extends StatelessWidget {
  const IslandWidget({
    super.key,
    required this.value,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.color,
  });

  final Widget value;
  final Widget icon;
  final Widget title;
  final Widget subTitle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(color: color.withAlpha(100), borderRadius: BorderRadius.circular(16)),
              child: (icon as Icon).clr(color.withValues(red: 20, green: 50, blue: 70)),
            ),
            5.height,
            (value as Text).size(40).bold(),
            (title as Text).tsTitle(),
            10.height,
            (subTitle as Text).tsBody(),
          ],
        ),
      ),
    );
  }
}
