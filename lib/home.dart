import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Razorpay? razorpay;
  TextEditingController? textEditingController;
  @override
  void initState() {
    super.initState();

    razorpay = new Razorpay();

    razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlerPaymentSuccess);
    razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    razorpay?.clear();
  }

  void openCheckout() {
    var options = {"key": "", "amount": ""};
  }

  void handlerPaymentSuccess() {
    Fluttertoast.showToast(msg: "Payment Successfull");
  }

  void handlerErrorFailure() {
    Fluttertoast.showToast(msg: "Payment Failed");
  }

  void handlerExternalWallet() {
    Fluttertoast.showToast(msg: "External Wallet");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Title(color: Colors.blueGrey, child: Text("Razor Pay")),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
            decoration: InputDecoration(hintText: "Amount to pay"),
          ),
          SizedBox(
            height: 20.0,
          ),
          RaisedButton(
            onPressed: () {},
            child: Text("Pay"),
          )
        ],
      ),
    );
  }
}
