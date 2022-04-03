import 'package:dungeons_and_dragons/ui/screens/game_screen/game_screen.dart';
import 'package:dungeons_and_dragons/ui/screens/home_screen/home_controller.dart';
import 'package:dungeons_and_dragons/ui/screens/home_screen/widgets/class_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/globals.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _controller = HomeController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.readClasses().then((value) {
      setState((){});
    });
  }

  Widget arrowButton({required IconData arrow, required void Function() onTap}) {
    return Container(
      height: 50,
      width: 50,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 1), // changes position of shadow
            ),
          ]
      ),
      child: IconButton(icon: Icon(arrow), onPressed: onTap),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 130,
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: PRIMARY_COLOR,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                )
              ),
              child: Text('D&D',
                  style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
            ),
            Container(
              child: Text('SELECIONE SUA EQUIPE',
                  style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400)),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 15),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 15),
              child: ValueListenableBuilder(
                valueListenable: _controller.selectedClasses,
                builder: (context, value, _) {
                  return Text('${_controller.selectedClasses.value}/6',
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400));
                },
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(bottom: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  arrowButton(arrow: Icons.arrow_back_ios, onTap: (){
                    _controller.scrollController.jumpTo(
                        _controller.scrollController.position.minScrollExtent
                    );
                  }),
                  const SizedBox(width: 30,),
                  arrowButton(arrow: Icons.arrow_forward_ios, onTap: (){
                    _controller.scrollController.jumpTo(
                        _controller.scrollController.position.maxScrollExtent
                    );
                  }),
                ],
              ),
            ),
            if(_controller.isLoading)
              const Expanded(child: Center(child: CircularProgressIndicator(),))
            else
              Container(
                alignment: Alignment.center,
                height: 250,
                child: const ClassList(),
              ),
            const SizedBox(height: 30,),
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const GameScreen()));
            },
              child:  Container(
                alignment: Alignment.center,
                child: Text('Continuar',
                    style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w200)),
                width: 220,
                height: 60,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              color: PRIMARY_COLOR,
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
