import 'package:amoora_mkt/cff/widgets/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: CustomInput(
        hintText: 'Masukan Pencarian',
        suffixIcon: Icon(SuperIcons.bs_search),
        borderRadius: 25,
      ),
    );
  }
}
