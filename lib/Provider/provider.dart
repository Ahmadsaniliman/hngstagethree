import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uiandtimbuapiimpl/Network/network.dart';

final productsProvider = FutureProvider(
  (_) {
    return NetworkCall().getAllProducts();
  },
);
