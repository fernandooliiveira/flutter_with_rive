import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class RiveTestPage extends StatefulWidget {
  const RiveTestPage({Key? key}) : super(key: key);

  @override
  State<RiveTestPage> createState() => _RiveTestPageState();
}

class _RiveTestPageState extends State<RiveTestPage> {
  late RiveAnimationController _controller;
  late RiveAnimationController _controller2;
  bool _isPlaying = false;

  @override
  void initState() {
    _controller = OneShotAnimation(
      //"NOME DO EVENTO
      "Hover",
      autoplay: false,
    );
    _controller2 = OneShotAnimation(
      //"NOME DO EVENTO
      "Press",
      autoplay: false,
    );
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Color(0xFF09101C)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 500,
              child: RiveAnimation.asset(
                "assets/animations/rive/vetor-loading.riv",
              ),
            ),
            MouseRegion(
              onEnter: (_) {
                _controller.isActive = true;
                setState(() {});
              },
              onExit: (_){

              },
              child: InkWell(
                onTap: () {
                  _controller2.isActive = true;
                  setState(() {});
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 200,
                  child: Center(
                    child: RiveAnimation.asset(
                      controllers: [_controller, _controller2],
                        "assets/animations/rive/bank-river-2.riv",

                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
