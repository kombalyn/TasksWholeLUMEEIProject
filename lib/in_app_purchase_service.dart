// in_app_purchase_service.dart

import 'package:in_app_purchase/in_app_purchase.dart';

class InAppPurchaseService {
  final InAppPurchase _iap = InAppPurchase.instance;
  bool _available = false;
  List<ProductDetails> _products = [];

  InAppPurchaseService() {
    _initializeIAP();
  }

  Future<void> _initializeIAP() async {
    _available = await _iap.isAvailable();

    if (_available) {
      const Set<String> kIds = <String>{
        'lumeei_5900ft_1m',
        'lumeei_59900ft_1y'
      };
      final ProductDetailsResponse response =
          await _iap.queryProductDetails(kIds);

      if (response.notFoundIDs.isNotEmpty) {
        //print('Products not found: ${response.notFoundIDs}');
      }

      _products = response.productDetails;
    }
  }

  Future<void> buyProduct(String productId) async {
    for (ProductDetails productDetails in _products) {
      if (productDetails.id == productId) {
        final PurchaseParam purchaseParam =
            PurchaseParam(productDetails: productDetails);
        _iap.buyNonConsumable(purchaseParam: purchaseParam);
      }
    }
  }

  List<ProductDetails> get products => _products;

  bool get isAvailable => _available;
}
