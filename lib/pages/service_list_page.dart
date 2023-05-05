import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:serpismotor2/models/user_model.dart';
import 'package:serpismotor2/providers/auth_provider.dart';
import 'package:serpismotor2/providers/cart_provider.dart';
import 'package:serpismotor2/providers/transaction_provider.dart';
import 'package:serpismotor2/services/transaction_service.dart';
import 'package:serpismotor2/theme.dart';
import 'package:serpismotor2/widgets/cart_card.dart';
import 'package:serpismotor2/widgets/service_list_card.dart';

class ServiceListPage extends StatefulWidget {
  const ServiceListPage({Key? key}) : super(key: key);

  @override
  State<ServiceListPage> createState() => _ServiceListPageState();
}

class _ServiceListPageState extends State<ServiceListPage> {
  late bool _isLoading = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    // TransactionProvider transactionProvider =
    //     Provider.of<TransactionProvider>(context);

    if (_isLoading) {
      setState(() {
        _isLoading = false;
      });

      // transactionProvider.getTransactions(authProvider.user.token!);

      setState(() {
        _isLoading = true;
      });
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    // TransactionProvider transactionProvider =
    //     Provider.of<TransactionProvider>(context);

    Widget header() {
      return AppBar(
        backgroundColor: backgroundColor1,
        centerTitle: true,
        toolbarHeight: 80,
        title: Text(
          "Your Service List",
          style: primaryTextStyle.copyWith(fontWeight: semibold),
        ),
        elevation: 0,
        automaticallyImplyLeading: false,
      );
    }

    Widget emptyCart() {
      return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon_empty_cart.png',
              width: 80,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Your Service List is Empty',
              style: primaryTextStyle.copyWith(
                fontSize: 16,
                fontWeight: medium,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s save your service list',
              style: secondaryTextStyle,
            ),
            Container(
              width: 154,
              height: 44,
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: Text(
                  'Explore',
                  style: primaryTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget content() {
      return Expanded(
        child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: defaultMargin,
            ),
            children: [
              // ...transactionProvider.transactions
              //     .map((transaction) => Container(
              //           color: Colors.red,
              //           height: 80,
              //           width: 100,
              //           child: Text(transaction.totalPrice.toString()),
              //         ))
              //     .toList(),
            ]),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor1,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: 14),
        child: FloatingActionButton(
          heroTag: null,
          mini: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            "assets/icon_back.png",
            color: blackColor,
            height: 18,
          ),
          backgroundColor:
              primaryColor, // sesuaikan dengan warna yang diinginkan
          shape: CircleBorder(),
          elevation: 1,
          // set shape menjadi CircleBorder
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          header(),
          _isLoading
              ? content()
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      ),
    );
  }
}
