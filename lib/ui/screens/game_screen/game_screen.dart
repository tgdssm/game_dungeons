import 'package:flutter/material.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
             image: AssetImage('assets/images/background_battlefield.jpg'),
            fit: BoxFit.cover,
          )
        ),
        child: Column(
          children: [
            Text('BOSS'),
            Container(
              child: Row(
                children: [
                  Column(

                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
