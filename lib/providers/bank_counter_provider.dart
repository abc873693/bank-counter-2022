import 'dart:math';

import 'package:bank_counter/models/bank_counter_model.dart';
import 'package:flutter/foundation.dart';

export 'package:bank_counter/models/bank_counter_model.dart';

const int maxWorkTime = 1500;
const int minWorkTime = 500;

final Random random = Random();

class BankCounterProvider extends ChangeNotifier {
  BankCounterProvider(this.model);

  final BankCounterModel model;

  int? processingClient;

  List<int> processedClients = <int>[];

  String get processedClientsText {
    StringBuffer buffer = StringBuffer();
    for (int client in processedClients) {
      if (buffer.isNotEmpty) buffer.write(',');
      buffer.write('$client');
    }
    return 'Processed: ${buffer.toString()}';
  }

  Future<void> process({
    required int user,
  }) async {
    processingClient = user;
    notifyListeners();
    await Future<void>.delayed(
      Duration(
        milliseconds: random.nextInt(maxWorkTime - minWorkTime) + minWorkTime,
      ),
    );
    processedClients.add(processingClient!);
    processingClient = null;
    notifyListeners();
  }
}
