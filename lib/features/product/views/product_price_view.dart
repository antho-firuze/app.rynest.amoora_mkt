import 'package:amoora_mkt/cff/utils/darkmode_utils.dart';
import 'package:amoora_mkt/cff/widgets/custom_rich_text.dart';
import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/widgets/exceptions/data_exeception_widget.dart';
import 'package:amoora_mkt/cff/widgets/forms/field_list.dart';
import 'package:amoora_mkt/features/product/controller/product_ctrl.dart';
import 'package:amoora_mkt/features/product/model/product.dart';
import 'package:amoora_mkt/cff/utils/currency_utils.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/my_ui.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductPriceView extends ConsumerWidget {
  const ProductPriceView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(productCtrlProvider).totalPriceUmroh;
    final item = ref.watch(productCtrlProvider).selectedProduct;
    if (item == null) {
      return DataExceptionWidget(type: ExeceptionType.dataEmpty);
    }
    return MyUI(
      child: Scaffold(
        appBar: AppBar(title: Text('Pesan Paket')),
        body: ListView(
          children: [
            10.height,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FieldList(
                    listType: ListType.topBottom,
                    caption: const Text('Nama Paket').tsTitle(),
                    value: Text(item.name).tsTitle().bold(),
                  ),
                  10.height,
                  FieldList(
                    listType: ListType.topBottom,
                    caption: const Text('Paket Hari').tsTitle(),
                    value: Text('${item.duration} Hari').tsTitle().bold(),
                  ),
                  10.height,
                  FieldList(
                    listType: ListType.topBottom,
                    caption: const Text('Keberangkatan').tsTitle(),
                    value: Text(item.departureDate?.yMMMMd() ?? '').tsTitle().bold(),
                  ),
                  10.height,
                  FieldList(
                    listType: ListType.topBottom,
                    caption: const Text('Pilihan Kamar').tsTitle(),
                    value: Column(
                      children: [
                        OptionsPrice(
                          type: 'Double',
                          subtype: '(1 Kamar ber-2)',
                          price: item.doublePrice.toIDR(),
                          item: item,
                          qty: ref.watch(productCtrlProvider).doubleQty,
                          onAdded: () => ref.read(productCtrlProvider).calculate('double', 'add'),
                          onRemoved: () => ref.read(productCtrlProvider).calculate('double', 'remove'),
                        ),
                        5.height,
                        OptionsPrice(
                          type: 'Triple',
                          subtype: '(1 Kamar ber-3)',
                          price: item.triplePrice.toIDR(),
                          item: item,
                          qty: ref.watch(productCtrlProvider).tripleQty,
                          onAdded: () => ref.read(productCtrlProvider).calculate('triple', 'add'),
                          onRemoved: () => ref.read(productCtrlProvider).calculate('triple', 'remove'),
                        ),
                        5.height,
                        OptionsPrice(
                          type: 'Quad',
                          subtype: '(1 Kamar ber-4)',
                          price: item.quadPrice.toIDR(),
                          item: item,
                          qty: ref.watch(productCtrlProvider).quadQty,
                          onAdded: () => ref.read(productCtrlProvider).calculate('quad', 'add'),
                          onRemoved: () => ref.read(productCtrlProvider).calculate('quad', 'remove'),
                        ),
                      ],
                    ),
                  ),
                  20.height,
                  Text('Total : ${totalPrice.toIDR()}').tsTitle().bold().clr(oRed50),
                  10.height,
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: ref.read(productCtrlProvider).bookingNow,
                      child: const Text('Selanjutnya'),
                    ),
                  ),
                  10.height,
                ],
              ),
            ),
            Container(),
          ],
        ),
      ),
    );
  }
}

class OptionsPrice extends StatelessWidget {
  const OptionsPrice({
    super.key,
    required this.item,
    required this.type,
    required this.subtype,
    required this.price,
    this.qty = 0,
    this.onAdded,
    this.onRemoved,
  });

  final Product? item;
  final String type;
  final String subtype;
  final String price;
  final int qty;
  final Function()? onAdded;
  final Function()? onRemoved;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: oBlack.whenDark(oWhite)!),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomRichText(
            TextSpan(
              text: type,
              style: tsTitle().bold(),
              children: [TextSpan(text: ' $subtype', style: tsTitle())],
            ),
          ),
          3.height,
          CustomRichText(
            TextSpan(
              text: 'Harga : ',
              style: tsTitle().bold(),
              children: [
                TextSpan(text: price, style: tsTitle().bold().clr(oRed50)),
                TextSpan(text: '/Pax', style: tsTitle()),
              ],
            ),
          ),
          5.height,
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: TextEditingController(text: qty.toString()),
                  style: tsTitle(),
                  textAlign: TextAlign.center,
                  readOnly: true,
                  decoration: const InputDecoration(prefixText: 'Jumlah ', suffixText: ' Pax'),
                ),
              ),
              5.width,
              SizedBox(
                height: 45,
                child: ToggleButtons(
                  isSelected: const [true, true],
                  onPressed: (index) {
                    if (index == 0) onAdded!();
                    if (index == 1) onRemoved!();
                  },
                  selectedColor: oGold,
                  borderRadius: BorderRadius.circular(6),
                  children: [
                    Icon(Icons.add, color: primaryLight.whenDark(oGold)),
                    Icon(Icons.remove, color: primaryLight.whenDark(oGold)),
                  ],
                ),
              ),
              // Row(
              //   mainAxisSize: MainAxisSize.min,
              //   children: [
              //     CustomIconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.add,
              //         color: oWhite,
              //       ),
              //     ),
              //     CustomIconButton(
              //       onPressed: () {},
              //       icon: const Icon(
              //         Icons.remove,
              //         color: oWhite,
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
