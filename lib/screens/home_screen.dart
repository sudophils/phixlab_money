import 'package:flutter/material.dart';

import '../data/user_data.dart';
import '../utils/constants.dart';
import '../widgets/income_expense_card.dart';
import '../widgets/transaction_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ListTile(
                leading: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  child: Image.asset(
                    "assets/images/avatar.jpeg",
                    width: 50,
                  ),
                ),
                title: Text(
                  "Hey, Phil!",
                  style: Theme.of(context)
                      .textTheme
                      .subtitle1
                      ?.copyWith(color: fontDark),
                ),
                trailing: Image.asset(
                  "assets/icons/bell.png",
                  width: 25,
                ),
              ),
              Center(
                child: Column(
                  children: [
                    const SizedBox(height: defaultSpacing / 2),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(vertical: defaultSpacing),
                      child: Text(userData.balance,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(
                                  color: fontHeading,
                                  fontSize: fontSizeHeading + 2,
                                  fontWeight: FontWeight.w800)),
                    ),
                    Text("Total Balance",
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: fontSubHeading,
                            fontSize: fontSizeBody,
                            fontWeight: FontWeight.w600)),
                    const SizedBox(
                      height: defaultSpacing * 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: IncomeExpenseCard(
                              bgColor: primaryDark,
                              label: "Income",
                              balance: userData.income,
                              icon: Icons.arrow_upward),
                        ),
                        const SizedBox(
                          width: defaultSpacing,
                        ),
                        Flexible(
                          child: IncomeExpenseCard(
                              bgColor: accent,
                              label: "Expenses",
                              balance: ' -${userData.outflow}',
                              icon: Icons.arrow_downward),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: defaultSpacing * 2,
                    ),
                    Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Recent transactions",
                          style: Theme.of(context)
                              .textTheme
                              .headline6
                              ?.copyWith(
                                  color: fontHeading,
                                  fontWeight: FontWeight.w600),
                        )),
                    const SizedBox(
                      height: defaultSpacing * 2,
                    ),

                    // Transactions
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultSpacing),
                        child: Text("Today"),
                      ),
                    ),
                    ...userData.transactions.map((transaction) =>
                        TransactionTile(transaction: transaction)),
                    const Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(vertical: defaultSpacing),
                        child: Text("Yesterday"),
                      ),
                    ),

                    ...transactions2.map((transaction) =>
                        TransactionTile(transaction: transaction)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
