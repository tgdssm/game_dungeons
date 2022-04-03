import 'package:dungeons_and_dragons/ui/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
               image: AssetImage('assets/images/background_battlefield.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: SafeArea(
            child: Column(
              children: [
                Text('BOSS'),
                Container(
                  width: 300,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Row(
                    children: [
                      Image.asset('assets/images/mobi.png', width: 80,),
                      const SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Falta de documentação',
                              style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w200)),
                          Text('Problema leve', ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Text('Número',
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 15,),

                Container(
                  alignment: Alignment.center,
                  child:  Text('Click no dado para jogar',
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                const SizedBox(height: 15,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                      alignment: Alignment.center,
                      child:  Image.asset('assets/images/d20.png', width: 200,),
                  ),
                ),
                const SizedBox(height: 15,),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.symmetric(horizontal: 55, vertical: 15),
                  child: Text('Número',
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  width: 400,
                  height: 300,
                  child: GridView.count(
                    crossAxisCount: 3,
                    children: globalClasses.where((element) => element.selected).map<Widget>((e){
                      return Column(
                        children: [
                          Text('HP: ${e.hp}',
                              style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                          Container(child: Image.asset(e.image, height: 80,), decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),)
                        ],
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
