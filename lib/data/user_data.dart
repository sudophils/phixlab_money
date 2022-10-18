enum TransactionType { outflow, inflow }

enum ItemCategory { grocery, fashion, payments }

class UserData {
  final String name;
  final String balance;
  final String income;
  final String outflow;
  final List<Transaction> transactions;

  const UserData(
      this.name, this.balance, this.income, this.outflow, this.transactions);
}

class Transaction {
  final ItemCategory itemCategory;
  final String itemCategoryName;
  final String itemName;
  final String amount;
  final String date;
  final String categoryImage;
  final TransactionType transactionType;

  const Transaction(
    this.itemCategory,
    this.itemCategoryName,
    this.itemName,
    this.amount,
    this.date,
    this.categoryImage,
    this.transactionType,
  );
}

const transactions = [
  Transaction(ItemCategory.fashion, "Shoes", "Nike landa", "\$40.00", "Sept, 23",
      "assets/images/nike.jpg", TransactionType.outflow),
  Transaction(ItemCategory.fashion, "Shoes", "Puma Ruin", "\$20.00", "Jul, 23",
      "assets/images/nike.jpg", TransactionType.outflow),
];

const transactions2 = [
  Transaction(ItemCategory.fashion, "Bag", "Prada Lato", "\$190.00", "Jun, 23",
      "assets/images/nike.jpg", TransactionType.outflow),
  Transaction(ItemCategory.payments, "Payment", "Transfer from UC", "\$10,500.00",
      "Jan, 23", "assets/images/nike.jpg", TransactionType.inflow),
];
const userData =
    UserData("Phils", "\$4,506.00", "\$12,450.00", "\$710.00", transactions);
