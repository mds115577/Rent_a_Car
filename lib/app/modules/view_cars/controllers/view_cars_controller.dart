import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class ViewCarsController extends GetxController {
  int pageIndex = 0;

  Razorpay? _razorpay;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSucces);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, handlerPaymentFailure);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void onClose() {
    super.onClose();
    _razorpay!.clear();
  }

  handlerPaymentSucces(PaymentSuccessResponse response) {
    print('payment success $response');
  }

  handlerPaymentFailure(PaymentFailureResponse response) {
    print('payment  failed $response');
  }

  handlerExternalWallet(ExternalWalletResponse response) {
    print('exte $response');
  }

  checkOut() {
    var options = {
      "key": "rzp_test_3zGtxnBS0A1wz0",
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8943845577', 'email': 'test@razorpay.com'},
      "external": {
        'wallets': ['paytm']
      }
    };
    try {
      _razorpay!.open(options);
    } catch (e) {
      Get.snackbar('title', e.toString(), backgroundColor: Colors.white);
    }
  }

  carouselChange(index) {
    pageIndex = index;
    update();
  }
}
