import 'package:flutter/material.dart';
import 'package:workmanager/workmanager.dart';

int a = 0; // Variável global para demonstração

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) {
    print("Executando tarefa em segundo plano, valor de a: $a");
    a = a + 1;
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: true, // alterar para false em produção
  );
  Workmanager().registerOneOffTask("1", "simpleTask");

  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/bebe.png',
          width: 50,
          height: 50,
        ),
        backgroundColor: const Color.fromARGB(255, 236, 237, 242),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints.expand(),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    print('Clicando no botão ${index + 1}');
                    Workmanager().cancelAll().then((_) {
                      print('Tarefa em segundo plano cancelada');
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Tarefa em segundo plano cancelada')),
                      );
                    }).catchError((error) {
                      print('Erro ao cancelar tarefa: $error');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text('Erro ao cancelar tarefa: $error')),
                      );
                    });
                  },
                  child: Text('Button ${a + index}'),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
