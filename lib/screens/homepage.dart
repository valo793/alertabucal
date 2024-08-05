import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
                  onPressed: () {},
                  child: Text('Button ${index + 1}'),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}
