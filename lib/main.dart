import 'package:flutter/material.dart';
import 'package:simple_cubit/cubits/contador/contador_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider.value(
        value: ContadorCubit(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ContadorCubit>();
    return BlocBuilder<ContadorCubit, ContadorEstado>(
      builder: (context, state) {
        if (state is ContadorCarregado) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '${state.valor}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  ElevatedButton(
                      onPressed: cubit.removeMaisUm, child: Icon(Icons.remove))
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: cubit.adicionaMaisUm,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          );
        }

        // se nao cair em nenhum dos estados
        // retorno um container
        return Container(
          color: Colors.green,
        );
      },
    );
  }
}
