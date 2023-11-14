enum TransactionType { outflow, inflow }

enum ItemCategoryType { fashion, grocery, payments }

class UserInfo {
  final String name;
  final String totalBalance;
  final String inflow;
  final String outflow;
  final List<Transaction> transactions;

  const UserInfo(
      {required this.name,
      required this.totalBalance,
      required this.inflow,
      required this.outflow,
      required this.transactions});
}

class Transaction {
  final ItemCategoryType categoryType;
  final TransactionType transactionType;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;

  const Transaction(
      {required this.categoryType,
      required this.transactionType,
      required this.itemCategoryName,
      required this.itemName,
      required this.amount,
      required this.date});
}

const List<Transaction> transactions1 = [
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Shoes",
      itemName: "Puma Sneaker",
      amount: "\$300.00",
      date: "Oct, 23"),
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Bag",
      itemName: "Gucci Flax",
      amount: "\$500.00",
      date: " Sept, 13"),
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Bag",
      itemName: "Gucci Flax",
      amount: "\$500.00",
      date: " Sept, 13"),
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Shoes",
      itemName: "Gucci sneak",
      amount: "\$900.00",
      date: " Sept, 13"),
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Bag",
      itemName: "Gucci laxi",
      amount: "\$1500.00",
      date: " Sept, 13"),
  Transaction(
      categoryType: ItemCategoryType.fashion,
      transactionType: TransactionType.outflow,
      itemCategoryName: "Bag",
      itemName: "Gucci Flax",
      amount: "\$500.00",
      date: " Sept, 13"),

];
const List<Transaction> transactions2 = [
  Transaction(
      categoryType: ItemCategoryType.payments,
      transactionType: TransactionType.inflow,
      itemCategoryName: "Payments",
      itemName: "Transfer from Eden",
      amount: "\$13,000.00",
      date: "Oct, 2"),

];

const userdata = UserInfo(
    name: "Jacob",
    totalBalance: "\$4,586.00",
    inflow: "\$4,000.00",
    outflow: "\$2000.00",
    transactions: transactions1);
