import 'package:bank_counter/providers/bank_counter_provider.dart';
import 'package:flutter/foundation.dart';

class BankProvider extends ChangeNotifier {
  late List<BankCounterProvider> counterProviders;

  int nextNumber = 1;

  List<int> waitingClientList = <int>[];

  BankProvider(
    List<BankCounterModel> counterList,
  ) {
    counterProviders = counterList
        .map(
          (e) => BankCounterProvider(e),
        )
        .toList();
  }

  Future<void> addNext() async {
    final int client = nextNumber++;
    for (BankCounterProvider provider in counterProviders) {
      if (provider.processingClient == null) {
        counterWork(provider, client);
        return;
      }
    }
    waitingClientList.add(client);
    notifyListeners();
  }

  Future<void> counterWork(
    BankCounterProvider provider,
    int client,
  ) async {
    await provider.process(user: client);
    if (waitingClientList.isNotEmpty) {
      counterWork(
        provider,
        waitingClientList.removeAt(0),
      );
      notifyListeners();
    }
  }
}
