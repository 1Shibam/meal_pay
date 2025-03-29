import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import 'dart:async';

class RazorPayService {
  // Singleton instance
  static final RazorPayService _instance = RazorPayService._internal();

  factory RazorPayService() => _instance;

  late Razorpay _razorpay;

  // Stream controllers to listen for payment events
  final StreamController<PaymentSuccessResponse> _successController =
      StreamController.broadcast();
  final StreamController<PaymentFailureResponse> _errorController =
      StreamController.broadcast();
  final StreamController<ExternalWalletResponse> _walletController =
      StreamController.broadcast();

  // Private constructor
  RazorPayService._internal() {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  // Public getters for streams
  Stream<PaymentSuccessResponse> get onSuccess => _successController.stream;
  Stream<PaymentFailureResponse> get onError => _errorController.stream;
  Stream<ExternalWalletResponse> get onWallet => _walletController.stream;

  // Start payment process
  final razorPayKey = dotenv.env['RAZOR_PAY_API_KEY'];
  void startPayment(
      {required double amount,
      required String contact,
      required String email}) {
    var options = {
      'key': razorPayKey,
      'amount': (amount * 100).toInt(), // Razorpay uses paise (multiply by 100)
      'currency': 'INR',
      'name': 'Your App Name',
      'description': 'Payment for order',
      'prefill': {
        'contact': contact,
        'email': email,
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print('Error opening Razorpay: $e');
    }
  }

  // Handle success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    _successController.add(response);
  }

  // Handle failure
  void _handlePaymentError(PaymentFailureResponse response) {
    _errorController.add(response);
  }

  // Handle external wallet
  void _handleExternalWallet(ExternalWalletResponse response) {
    _walletController.add(response);
  }

  // Dispose function to clean up resources
  void dispose() {
    _razorpay.clear();
    _successController.close();
    _errorController.close();
    _walletController.close();
  }
}

