import 'package:flutter/material.dart';
import 'package:learn_flutter/demo/k24_bloc/bloc_data.dart';
import 'package:learn_flutter/demo/k24_bloc/bloc_provider.dart';

main() {
  // 1、runApp 函数
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        bloc: BlocData(),
        child: KKHomePage()
      ),
    );
  }
}

class KKHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BlocData bloc = BlocProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc"),
      ),
      body: KKHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          bloc.inStream.add(1);
        },
      ),
    );
  }
}

class KKHomeContent extends StatefulWidget {
  @override
  _KKHomeContentState createState() => _KKHomeContentState();
}

class _KKHomeContentState extends State<KKHomeContent> {

  @override
  Widget build(BuildContext context) {
    final BlocData bloc = BlocProvider.of(context);

    return Center(
      child: StreamBuilder<int>(
        stream: bloc.outStream,
        initialData: 0,
        builder: (context, snapshot) {
          return ActionChip(
            label: Text("${snapshot.data}"),
            onPressed: () {
              bloc.inStream.add(1);
            },
          );
        },
      ),
    );
  }
}


