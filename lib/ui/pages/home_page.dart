import 'package:bank_counter/providers/bank_counter_provider.dart';
import 'package:bank_counter/providers/bank_provider.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final List<BankCounterModel> counterList;

  const HomePage({
    super.key,
    required this.counterList,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late BankProvider bankProvider;

  @override
  void initState() {
    bankProvider = BankProvider(widget.counterList);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bank Counter'),
        actions: [
          Center(
            child: AnimatedBuilder(
              animation: bankProvider,
              builder: (BuildContext context, Widget? child) {
                return Text(
                  'Waiting: ${bankProvider.waitingClientList.length}',
                );
              },
            ),
          ),
          const SizedBox(width: 16.0),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        itemCount: bankProvider.counterProviders.length,
        itemBuilder: (context, index) {
          final counterProvider = bankProvider.counterProviders[index];
          return AnimatedBuilder(
            animation: counterProvider,
            builder: (BuildContext context, Widget? child) {
              return ListTile(
                title: Text(counterProvider.model.name),
                trailing: Text(
                  counterProvider.processingClient?.toString() ?? 'Idle',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                subtitle: Text(
                  counterProvider.processedClientsText,
                ),
              );
            },
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          height: 8.0,
        ),
      ),
      floatingActionButton: AnimatedBuilder(
        animation: bankProvider,
        builder: (BuildContext context, Widget? child) {
          return FloatingActionButton.extended(
            onPressed: bankProvider.addNext,
            label: Text('Next ${bankProvider.nextNumber}'),
          );
        },
      ),
    );
  }
}
