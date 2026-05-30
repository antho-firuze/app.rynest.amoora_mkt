import 'dart:async';

import 'package:amoora_mkt/cff/models/reqs.dart';
import 'package:amoora_mkt/cff/services/api_service.dart';
import 'package:amoora_mkt/cff/utils/data_type_utils.dart';
import 'package:amoora_mkt/cff/utils/datetime_utils.dart';
import 'package:amoora_mkt/cff/utils/path_service.dart';
import 'package:amoora_mkt/cff/utils/string_utils.dart';
import 'package:amoora_mkt/features/product/model/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

part 'product_ctrl.g.dart';

final fetchProductsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final reqs = Reqs(
    path: '/api/v1/package/list',
    data: {'type': 'umrah', 'order_by': 'date', 'order_type': 'asc', 'offset': 0, 'limit': 4},
  );
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  Map<String, dynamic> json = state.value;
  final result = json;

  return result;
});

final fetchProductByIdProvider = FutureProvider.family<Map<String, dynamic>?, int>((ref, id) async {
  final reqs = Reqs(path: '/api/v1/package/byId', data: {"id": id});
  final state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

  Map<String, dynamic> json = state.value;
  // final result = Product.fromJson(json);
  final result = json;

  return result;
});

@riverpod
class productList extends _$productList {
  bool _hasMore = true;
  int _offset = 0;
  int _limit = 4;
  int _count = 0;
  String _search = '';
  Map<String, dynamic> _sorts = {};
  Map<String, dynamic> _filter = {};

  @override
  FutureOr<List<int>> build() async => await _fetchData();

  Future _fetchData() async {
    Map<String, dynamic> data = {
      'search': _search,
      'offset': _offset,
      'limit': _limit,
      'sorts': {},
      'filter': {},
    };
    final reqs = Reqs(path: '/api/v1/package/list', data: data);
    final _state = await AsyncValue.guard(() async => await ref.read(apiServiceProvider).fetch(reqs: reqs));

    final json = _state.value as Map<String, dynamic>;
    final _items = List<int>.from(json.toList('result_ids'));

    _search = json.toStr('search');
    _offset = json.toInt('offset');
    _limit = json.toInt('limit');
    _filter = json['filter'] == null ? {} : json['filter'];
    _sorts = json['sorts'] == null ? {} : json['sorts'];
    _count = json.toInt('count');

    return _items;
  }

  Future loadMore() async {
    _offset = _offset + _limit;
    final result = await _fetchData();

    List<int> newList = [...state.value ?? [], ...result];

    state = AsyncData(newList);
    
    if (state.value != null) {
      if (state.value!.length >= _count) {
        _hasMore = false;
      }
    }
  }

  Future searchData(String searchTerm) async {
    _search = searchTerm;
    _offset = 0;
    _hasMore = true;
    final result = await _fetchData();

    List<int> newList = result;

    state = AsyncData(newList);

    if (state.value != null) {
      if (state.value!.length >= _count) {
        _hasMore = false;
      }
    }
  }

  bool get hasMore => _hasMore;

  String get search => _search;

  int get offset => _offset;

  int get limit => _limit;

  Map<String, dynamic>? get filter => _filter;

  Map<String, dynamic>? get sorts => _sorts;
}

final productCtrlProvider = Provider(ProductCtrl.new);

class ProductCtrl {
  Ref ref;
  ProductCtrl(this.ref);

  bool viewGrid = false;
  Product? selectedProduct;
  int doubleQty = 0;
  int tripleQty = 0;
  int quadQty = 0;
  double totalPriceUmroh = 0.0;

  Future share({required String text, required String filename}) async {
    var directory = await ref.read(pathServiceProvider).getAppFileDirectory();
    var file = XFile("$directory/$filename");

    await SharePlus.instance.share(ShareParams(text: 'Paket ${text.toCamelCase()} Amoora Travel', files: [file]));
  }

  void calculate(String roomType, String calcType) {
    switch (roomType) {
      case 'double':
        if (calcType == 'add') {
          doubleQty = doubleQty + 1;
        } else {
          if (doubleQty < 1) return;
          doubleQty = doubleQty - 1;
        }
        break;
      case 'triple':
        if (calcType == 'add') {
          tripleQty = tripleQty + 1;
        } else {
          if (tripleQty < 1) return;
          tripleQty = tripleQty - 1;
        }
        break;
      case 'quad':
        if (calcType == 'add') {
          quadQty = quadQty + 1;
        } else {
          if (quadQty < 1) return;
          quadQty = quadQty - 1;
        }
        break;
    }

    double doublePrice = selectedProduct?.doublePrice ?? 0;
    double triplePrice = selectedProduct?.triplePrice ?? 0;
    double quadPrice = selectedProduct?.quadPrice ?? 0;

    totalPriceUmroh = (doublePrice * doubleQty) + (triplePrice * tripleQty) + (quadPrice * quadQty);
  }

  void bookingNow() {
    var paket = selectedProduct?.name;
    var hari = '${selectedProduct?.duration} hari';
    var tanggal = selectedProduct?.departureDate!.yMMMMd();
    var text =
        "Assalamu'alaikum *Amoora Travel*\n\n"
        "Saya ingin mendaftar paket umrah *$paket* program *$hari* untuk "
        "keberangkatan tanggal *$tanggal*";
    text += doubleQty > 0 || tripleQty > 0 || quadQty > 0 ? "\n\nDengan kamar :" : "";
    text += doubleQty > 0 ? "\n- *Double* : $doubleQty pax" : "";
    text += tripleQty > 0 ? "\n- *Triple* : $tripleQty pax" : "";
    text += quadQty > 0 ? "\n- *Quad* : $quadQty pax" : "";
    text += "\n\nMohon informasi lebih lanjut terkait paket tersebut";

    var number = '+6282311340011';
    launchUrl(Uri.parse('https://wa.me/$number/?text=${Uri.encodeComponent(text)}'));
  }
}
