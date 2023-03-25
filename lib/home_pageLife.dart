import 'package:flutter/material.dart';
import 'package:life_cycle/pages/SignUpPage.dart';
import 'package:life_cycle/service/user_state.dart';

import 'model/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserModel? user;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await service.getUser();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
      ),
      body: Column(
        children: [
          Card(
            child: ListTile(
              leading: Text(user?.id ?? ''),
              title: Text(user?.name ?? ''),
              subtitle: Text(user?.lastName ?? ''),
              trailing: Text(user?.password ?? ''),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await service.signOut();
              // ignore: use_build_context_synchronously
              await Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
                (route) => false,
              );
            },
            child: const Text('SigOut'),
          ),
          ElevatedButton(
            onPressed: () async {
              await service.delete();
              // ignore: use_build_context_synchronously
              await Navigator.pushAndRemoveUntil<void>(
                context,
                MaterialPageRoute(builder: (context) => SignUpPage()),
                (route) => false,
              );
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}
