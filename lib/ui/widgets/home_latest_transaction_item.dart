import 'package:flutter/material.dart';
import 'package:flutter_sha/models/transaction_model.dart';
import 'package:flutter_sha/shared/shared_methods.dart';
import 'package:flutter_sha/shared/theme.dart';
import 'package:intl/intl.dart';

class HomeLatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const HomeLatestTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    String thumbnail() {
      if (transaction.transactionType!.code == 'internet') {
        return 'assets/ic_trx_internet.png';
      } else if (transaction.transactionType!.code == 'top_up') {
        return 'assets/ic_trx_topup.png';
      } else if (transaction.transactionType!.code == 'transfer' ||
          transaction.transactionType!.code == 'receive') {
        return 'assets/ic_trx_transfer.png';
      } else {
        return 'assets/ic_trx_internet.png';
      }
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        children: [
          Image.asset(thumbnail(), width: 48),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name!,
                  style: blackTextStyle.copyWith(
                    fontSize: 16,
                    fontWeight: medium,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  DateFormat('MMM dd').format(transaction.createdAt!),
                  style: grayTextStyle.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),
          Text(
            formatCurrency(
              transaction.amount!,
              symbol: transaction.transactionType!.action == 'cr' ? '+ ' : '- ',
            ),
            style: blackTextStyle.copyWith(fontSize: 16, fontWeight: medium),
          ),
        ],
      ),
    );
  }
}
