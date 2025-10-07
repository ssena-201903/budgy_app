import 'package:budgy_project/providers/member_provider.dart';
import 'package:budgy_project/providers/transaction_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Added missing import for MultiProvider

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MembersProvider()),
        ChangeNotifierProvider(create: (_) => TransactionsProvider()),
        ChangeNotifierProvider(
          create: (_) => PoolProvider(
            membersProvider: Provider.of<MembersProvider>(context, listen: false),
            transactionsProvider: Provider.of<TransactionsProvider>(context, listen: false),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue, // Added basic theme
          useMaterial3: true,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Flutter App')),
      body: Center(
        child: Consumer<MembersProvider>(
          builder: (context, membersProvider, child) {
            // Example: Display something from MembersProvider
            return Text(
              'Members: ${membersProvider.members.length}',
              style: const TextStyle(fontSize: 20),
            );
          },
        ),
      ),
    );
  }
}

// Example placeholder for PoolProvider (adjust based on your actual implementation)
class PoolProvider with ChangeNotifier {
  final MembersProvider membersProvider;
  final TransactionsProvider transactionsProvider;

  PoolProvider({
    required this.membersProvider,
    required this.transactionsProvider,
  });
}