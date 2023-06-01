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

class ServiceListHomePage extends StatefulWidget {
  // const ServiceListPage({Key? key}) : super(key: key);
  final String token;
  ServiceListHomePage({required this.token});

  @override
  State<ServiceListHomePage> createState() => _ServiceListHomePageState();
}

class _ServiceListHomePageState extends State<ServiceListHomePage> {
  @override
  Widget build(BuildContext context) {
    print(widget.token);
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    TransactionProvider transactionProvider =
        Provider.of<TransactionProvider>(context);

    loadProduct() async {
      await Provider.of<TransactionProvider>(context, listen: false)
          .getTransactions(widget.token);
      setState(() {});
    }

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

    return Scaffold(
      backgroundColor: backgroundColor1,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            header(),
            FutureBuilder(
              future: Provider.of<TransactionProvider>(context, listen: false)
                  .getTransactions(widget.token),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Expanded(
                    child: Center(
                      child: Text('Failed to load transaction list'),
                    ),
                  );
                } else {
                  return Consumer<TransactionProvider>(
                      builder: (context, transactionProvider, _) {
                    if (transactionProvider.transactions.isEmpty) {
                      return Expanded(
                        child: Center(
                          child: Text('No Service List Found'),
                        ),
                      );
                    } else {
                      return Expanded(
                        child: RefreshIndicator(
                          onRefresh: () {
                            return Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                loadProduct();
                              });
                            });
                          },
                          color: primaryColor,
                          child: ListView.builder(
                            padding: EdgeInsets.only(top: 1),
                            physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics(),
                            ),
                            itemCount: transactionProvider.transactions.length,
                            itemBuilder: (context, index) {
                              final transaction = transactionProvider
                                  .transactions.reversed
                                  .toList()[index];
                              return ServiceListCard(transaction);
                            },
                          ),
                        ),
                      );
                    }
                  });
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
