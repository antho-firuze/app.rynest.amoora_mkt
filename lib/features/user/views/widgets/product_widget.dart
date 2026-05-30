import 'dart:io';

import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/utils/currency_utils.dart';
import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/utils/data_type_utils.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/download_utils.dart';
import 'package:amoora_mkt/cff/utils/page_utils.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:amoora_mkt/cff/widgets/custom_ink_well.dart';
import 'package:amoora_mkt/cff/widgets/exceptions/data_exeception_widget.dart';
import 'package:amoora_mkt/cff/widgets/exceptions/image_failed_layout.dart';
import 'package:amoora_mkt/cff/widgets/icon_text.dart';
import 'package:amoora_mkt/features/product/controller/product_ctrl.dart';
import 'package:amoora_mkt/features/product/views/product_detail_view.dart';
import 'package:amoora_mkt/features/product/views/product_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';
import 'package:super_icons/super_icons.dart';

class ProductWidget extends ConsumerWidget {
  const ProductWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(child: Text('Paket Amoora Travel').tsHeadline().bold().clr(primaryLight)),
              InkWell(
                onTap: () => context.goto(page: const ProductView()),
                child: Row(
                  children: [
                    Icon(SuperIcons.mg_sort_descending_line, size: 18, color: linkColorLight),
                    5.width,
                    Text('Sort').tsCaption().clr(linkColorLight),
                  ],
                ),
              ),
            ],
          ),
        ),
        10.height,
        ref
            .watch(fetchProductsProvider)
            .when(
              skipLoadingOnRefresh: false,
              error: (error, stackTrace) => Padding(
                padding: const EdgeInsets.only(top: 20),
                child: DataExceptionWidget(error: error, onTap: () => ref.refresh(fetchProductsProvider)),
              ),
              loading: () => const Center(child: CircularProgressIndicator()),
              data: (data) {
                List items = data.toList('result_ids');
                if (items.isEmpty) {
                  return DataExceptionWidget(
                    type: ExeceptionType.dataEmpty,
                    onTap: () => ref.refresh(fetchProductsProvider),
                  );
                }

                return OrientationBuilder(
                  builder: (context, orientation) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: StaggeredGridView.extentBuilder(
                        maxCrossAxisExtent: 600,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                        padding: EdgeInsets.zero,
                        // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        //   maxCrossAxisExtent: 600,
                        //   mainAxisExtent: 290,
                        //   crossAxisSpacing: 10,
                        //   mainAxisSpacing: 10,
                        // ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return ref
                              .watch(fetchProductByIdProvider(items[index]))
                              .when(
                                skipLoadingOnRefresh: false,
                                data: (data) {
                                  if (data == null) {
                                    return DataExceptionWidget(
                                      type: ExeceptionType.dataEmpty,
                                      onTap: () => ref.refresh(fetchProductByIdProvider(items[index])),
                                    );
                                  }

                                  return cardLayout(context, ref, data);
                                },
                                error: (error, stackTrace) => DataExceptionWidget(
                                  error: error,
                                  onTap: () => ref.refresh(fetchProductByIdProvider(items[index])),
                                ),
                                loading: () => const Center(child: CircularProgressIndicator()),
                              );
                        },
                      ),
                    );
                  },
                );
              },
            ),
      ],
    );
  }

  Card cardLayout(BuildContext context, WidgetRef ref, Map<String, dynamic> data) {
    return Card(
      child: CustomInkWell(
        radius: 10,
        onTap: () => context.goto(page: ProductDetailView(data: data)),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  headerLayout(ref, data),
                  // BODY
                  bodyLayout(context, data),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerLayout(WidgetRef ref, Map<String, dynamic> data) {
    final fetchImage = ref.watch(
      fetchImageProvider(Reqs(url: data['image'], fileKey: "${data['id']}_${data['type']}")),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Thumbnail
        SizedBox(
          height: 140,
          child: fetchImage.when(
            data: (data) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  image: DecorationImage(image: FileImage(File(data)), fit: BoxFit.cover),
                ),
              );
            },
            error: (error, stackTrace) {
              return ImageFailedLayout(
                onTap: () =>
                    ref.refresh(fetchImageProvider(Reqs(url: data['image'], fileKey: "${data['id']}_${data['type']}"))),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
          ),
        ),
      ],
    );
  }

  Widget bodyLayout(BuildContext context, Map<String, dynamic> data) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          7.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // PACKAGE NAME
                    // Text(jsonStr(data, 'name')).tsTitle().bold(),
                    Text(data.toStr('name')).tsTitle().bold(),
                    IconText(
                      text: Text(data.toDateTime('departure_date')?.yMMMMd() ?? "-").tsCaption(),
                      icon: Icon(Icons.calendar_month, size: 15, color: oBlack50.whenDark(oWhite50)),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Mulai').clr(primaryLight),
                  Text(data.toDouble('price_quad').toIDR()).clr(primaryLight).bold(),
                  Text('/pax Quad').clr(primaryLight),
                ],
              ),
            ],
          ),
          10.height,
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(color: primaryLight.withAlpha(30), borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Row(
                  children: [
                    IconText(
                      text: Text(data.toStr('hotel_makkah')),
                      icon: Icon(Icons.hotel, size: 15, color: Colors.brown),
                    ),
                    Text(' - '),
                    Text("${data.toInt('hotel_makkah_nights')}N"),
                  ],
                ),
                Row(
                  children: [
                    IconText(
                      text: Text(data.toStr('hotel_madinah')),
                      icon: Icon(Icons.hotel, size: 15, color: Colors.brown),
                    ),
                    Text(' - '),
                    Text("${data.toInt('hotel_madinah_nights')}N"),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
