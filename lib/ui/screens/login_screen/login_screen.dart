import 'package:dungeons_and_dragons/ui/screens/home_screen/home_screen.dart';
import 'package:dungeons_and_dragons/ui/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/image_login.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Pressione o botão para começar',
            style: GoogleFonts.yanoneKaffeesatz(color: Colors.white, fontSize: 25, fontWeight: FontWeight.w200),),
            const SizedBox(height: 30,),
            MaterialButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
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
              color: PRIMARY_COLOR ,
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}
