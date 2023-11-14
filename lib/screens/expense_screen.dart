import 'package:bezier_chart_plus/bezier_chart_plus.dart';
import 'package:flutter/material.dart';
import 'package:phixlab_money/utils/constants.dart';
import 'package:phixlab_money/widget/custom_selector.dart';

import '../data/userInfo.dart';
import '../widgets/transaction_tile.dart';

class ExpenseScreen extends StatefulWidget {
  const ExpenseScreen({Key? key}) : super(key: key);

  @override
  State<ExpenseScreen> createState() => _ExpenseScreenState();
}

class _ExpenseScreenState extends State<ExpenseScreen> {
  int selectedIndex = 0;
  int _selectedCategoryIndex = 0;
  static const selectorLabels = ['Day', 'Week', 'Month'];
  List<String>? _transCategories;
  List<Transaction> transactions = [];
  List<Transaction> transactionsFilter = [];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      transactions = [...transactions1, ...transactions2];
      getTransactionCategories();
    });
    super.initState();
  }

  void getTransactionCategories() {
    setState(() {
      transactionsFilter.addAll(transactions);
      _transCategories =
          transactions.map((e) => e.itemCategoryName).toSet().toList();
    });
  }

  getTimeFrameView(int index) {
    switch (index) {
      case 0:
      case 1:
        return Center(
            child: Container(
                color: Colors.transparent,
                height: 300,
                width: double.infinity,
                child: Center(child: Text('No Data yet'))));
      case 2:
        return ExpenseTimeFrame();
    }
  }

  updateTrxCategoriesView(String item) {
    setState(() {
      transactionsFilter = transactions
          .where((element) => item == element.itemCategoryName)
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Expense", style: TextStyle(color: fontDarker)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        // backgroundColor: background,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(defaultSpacing),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    getTimeFrameView(selectedIndex),
                    Container(
                      margin: const EdgeInsets.all(16),
                      height: 45,
                      child: Row(
                        children: [
                          Expanded(
                            child: Center(
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: selectorLabels.length,
                                  itemBuilder: (context, index) {
                                    final item = selectorLabels[index];
                                    return CustomSelector(
                                        onTap: () {
                                          setState(() {
                                            selectedIndex = index;
                                          });
                                          print(item);
                                        },
                                        label: item,
                                        isSelected: selectedIndex ==
                                            selectorLabels.indexOf(item));
                                  }),
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 16.0),
                            child: Icon(Icons.calendar_month_rounded),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text('Detail transactions',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: fontDark, fontWeight: FontWeight.w600)),
                ),
                Row(
                  children: [
                    ...?_transCategories?.map((e) {
                      int index = _transCategories!.indexOf(e);
                      final item = _transCategories?[index];

                      return CustomSelector(
                        height: 40,
                          onTap: () {
                            transactionsFilter.clear();
                            setState(() {});
                            updateTrxCategoriesView(item);
                            setState(() {
                              _selectedCategoryIndex = index;
                            });
                          },
                          label: item!,
                          isSelected: _selectedCategoryIndex ==
                              _transCategories?.indexOf(item));
                    }),
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                ...transactionsFilter.map(
                    (transaction) => TransactionTile(transaction: transaction))
              ],
            ),
          ),
        ));
  }
}

class ExpenseTimeFrame extends StatelessWidget {
  ExpenseTimeFrame({super.key});

  final fromDate = DateTime(2023, 6, 30);
  final toDate = DateTime(2023, 9, 30);

  final date1 = DateTime.now().subtract(const Duration(days: 6));
  final date2 = DateTime.now().subtract(const Duration(days: 90));

  final date3 = DateTime.now().subtract(const Duration(days: 70));
  final date4 = DateTime.now().subtract(const Duration(days: 50));
  final date5 = DateTime.now().subtract(const Duration(days: 70));
  final date6 = DateTime.now().subtract(const Duration(days: 50));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height / 3,
        width: MediaQuery.of(context).size.width,
        child: BezierChart(
          bezierChartScale: BezierChartScale.monthly,
          fromDate: fromDate,
          toDate: toDate,
          selectedDate: toDate,
          series: [
            BezierLine(
              label: "Expenses",
              onMissingValue: (dateTime) {
                if (dateTime.month.isEven) {
                  return 300.0;
                }
                return 0.0;
              },
              data: [
                DataPoint<DateTime>(value: 900, xAxis: date1),
                DataPoint<DateTime>(value: 200, xAxis: date2),
                DataPoint<DateTime>(value: 70, xAxis: date3),
                DataPoint<DateTime>(value: 100, xAxis: date4),
                DataPoint<DateTime>(value: 100, xAxis: date5),
                DataPoint<DateTime>(value: 100, xAxis: date6),
              ],
              lineColor: Colors.red,
            ),
          ],
          config: BezierChartConfig(
              verticalIndicatorStrokeWidth: .5,
              verticalIndicatorColor: Colors.blueGrey,
              showVerticalIndicator: true,
              verticalIndicatorFixedPosition: false,
              footerHeight: 30.0,
              xAxisTextStyle: const TextStyle(
                color: Colors.blueGrey,
              ),
              updatePositionOnTap: true,
              contentWidth: MediaQuery.of(context).size.width),
        ),
      ),
    );
  }
}
