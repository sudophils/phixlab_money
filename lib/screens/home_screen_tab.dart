import 'package:flutter/material.dart';
import 'package:phixlab_money/data/userInfo.dart';

import '../utils/constants.dart';
import '../widget/income_expense_card.dart';
import '../widget/transaction_item_tile.dart';

class HomeScreenTab extends StatelessWidget {
  const HomeScreenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(defaultSpacing),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: defaultSpacing * 4,
            ),
            ListTile(
              title:  Text(" Hey! ${userdata.name}!"),
              leading: ClipRRect(
                  borderRadius:
                      const BorderRadius.all(Radius.circular(defaultRadius)),
                  child: Image.asset("assets/images/avatar.jpeg")),
              trailing: Image.asset("assets/icons/bell.png"),
            ),
            const SizedBox(
              height: defaultSpacing,
            ),
            Center(
              child: Column(
                children: [
                  Text(
                    " ${userdata.totalBalance}",
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: fontSizeHeading, fontWeight: FontWeight.w800),
                  ),
                  const SizedBox(
                    height: defaultSpacing / 2,
                  ),

                  Text(
                    "Total balance",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(color: fontSubHeading),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children:  [
                Expanded(
                    child: IncomeExpenseCard(
                        expenseData: ExpenseData("Income", " ${userdata.inflow}",
                            Icons.arrow_upward_rounded))),
               const SizedBox(
                  width: defaultSpacing,
                ),
                Expanded(
                    child: IncomeExpenseCard(
                        expenseData: ExpenseData("Expense", "-${userdata.outflow}",
                            Icons.arrow_downward_rounded)))
              ],
            ),
            const SizedBox(
              height: defaultSpacing * 2,
            ),
            Text(
              "Recent Transactions",
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: defaultSpacing,
            ),
            const Text(
              "Today",
              style: TextStyle(color: fontSubHeading),
            ),
             ...userdata.transactions.map((transaction) => TransactionItemTile(transaction:transaction)),
            const SizedBox(
              height: defaultSpacing,
            ),
            const Text(
              "Yesterday",
              style: TextStyle(color: fontSubHeading),
            ),
            ...transactions2.map((transaction) => TransactionItemTile(transaction:transaction)),
          ],
        ),
      ),
    );
  }
}
