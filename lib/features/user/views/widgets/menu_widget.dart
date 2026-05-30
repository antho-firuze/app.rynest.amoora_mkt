import 'package:amoora_mkt/cff/core/app_color.dart';
import 'package:amoora_mkt/cff/widgets/custom_ink_well.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:amoora_mkt/features/user/controller/menu_ctrl.dart';
import 'package:amoora_mkt/cff/utils/ui_helper.dart';

class MenuWidget extends ConsumerWidget {
  const MenuWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(padding: const EdgeInsets.only(left: 20), child: Text('Menu Utama').tsTitle().bold()),
        listStyle(ref),
      ],
    );
  }

  Widget listStyle(WidgetRef ref) {
    return SizedBox(
      height: 105.whenLandscape(105),
      child: ListView.separated(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => 0.width,
        itemCount: AppMenu.values.length,
        itemBuilder: (context, index) {
          final item = AppMenu.values[index];
          if (item.code == '02')
            return MenuButton(
              bgColor: const Color(0xFF124D7C),
              item: item,
              // count: 99,
              // hasNotif: true,
              iconPath: "assets/icons/menu/${item.image}",
              onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
            );
          return MenuButton(
            item: item,
            iconPath: "assets/icons/menu/${item.image}",
            onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
          );
        },
      ),
    );
  }

  Widget gridStyle(WidgetRef ref) {
    return GridView.builder(
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4.whenLandscape(6)!.toInt(),
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
        mainAxisExtent: 120,
      ),
      itemCount: AppMenu.values.length,
      itemBuilder: (context, index) {
        final item = AppMenu.values[index];
        return MenuButton(
          item: item,
          // hasNotif: true,
          iconPath: "assets/icons/menu/${item.image}",
          onTap: () async => await ref.read(menuCtrlProvider).goto(item.code),
        );
      },
    );
  }
}

class MenuButton extends ConsumerWidget {
  const MenuButton({
    super.key,
    required this.item,
    required this.iconPath,
    this.count = 0,
    this.hasNotif = false,
    this.color,
    this.onTap,
    this.bgColor,
  });

  final String iconPath;
  final AppMenu item;
  final int count;
  final bool hasNotif;
  final Color? color;
  final Color? bgColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const size = 65.0;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        SizedBox(
          width: size + 40,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: CustomInkWell(
                  radius: 13,
                  onTap: onTap,
                  child: Card(
                    elevation: 0,
                    color: bgColor ?? Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(13),
                      side: BorderSide(color: Colors.grey.shade300),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset(iconPath, color: color, height: size - 30, width: size - 30),
                    ),
                  ),
                ),
              ),
              5.height,
              Text(item.name.toUpperCase(), softWrap: true).center().family("Roboto").size(12).bold(),
            ],
          ),
        ),
        if (hasNotif)
          Positioned(
            right: 14,
            top: 14,
            child: Padding(
              padding: const EdgeInsets.only(top: 6, right: 10),
              child: SizedBox(
                width: 7,
                height: 7,
                child: Container(
                  decoration: BoxDecoration(color: oRed, shape: BoxShape.circle),
                ),
              ),
            ),
          ),
        if (count > 0)
          Positioned(
            right: 3,
            top: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8, right: 8),
              child: Container(
                width: 25,
                height: 25,
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(color: oRed, shape: BoxShape.circle),
                child: Center(child: Text('$count').clr(oWhite)),
              ),
            ),
          ),
      ],
    );
  }
}
