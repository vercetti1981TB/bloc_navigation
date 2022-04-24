import 'package:demo/drawer_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (context) => DrawerCubit(),
    child: MaterialApp(
      home: MyApp(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('Home'),
                  tileColor: context.watch<DrawerCubit>().state == 0
                      ? Colors.blue
                      : Colors.red,
                  onTap: () {
                    context.read<DrawerCubit>().toggle(0);
                  },
                ),
                SizedBox(height: 10),
                ListTile(
                  tileColor: context.watch<DrawerCubit>().state == 1
                      ? Colors.blue
                      : Colors.red,
                  title: Text('Away'),
                  onTap: () {
                    context.read<DrawerCubit>().toggle(1);
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocBuilder<DrawerCubit, int>(
              builder: (context, index) {
                return Expanded(
                  child: index == 0
                      ? HomeWidget()
                      : index == 1
                          ? AwayWidget()
                          : Container(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
    );
  }
}

class AwayWidget extends StatelessWidget {
  const AwayWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
    );
  }
}
