import 'package:flutter/material.dart';
import 'homepage.dart';

class InitFadeTransition extends StatefulWidget {
  const InitFadeTransition({super.key});

  @override
  State<InitFadeTransition> createState() => _InitFadeTransitionState();
}

class _InitFadeTransitionState extends State<InitFadeTransition>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  );

  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
  );

  @override
  void initState() {
    super.initState();
    // Inicia a animação forward
    _controller.forward().then((_) async {
      // Aguarda a duração da animação para iniciar o reverse
      await Future.delayed(_controller.duration!);
      _controller.reverse();
    });

    // Adiciona um listener para navegar para a página Home quando a animação reverse terminar
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color.fromARGB(255, 236, 237, 242),
      child: FadeTransition(
        opacity: _animation,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Image.asset('assets/bebe.png'),
        ),
      ),
    );
  }
}
