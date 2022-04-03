import 'package:dungeons_and_dragons/ui/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../home_controller.dart';

class ClassList extends StatefulWidget {
  const ClassList({Key? key}) : super(key: key);

  @override
  _ClassListState createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  final _controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: globalClasses.length,
      scrollDirection: Axis.horizontal,
      controller: _controller.scrollController,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            globalClasses[index].selected = !globalClasses[index].selected;
            if(globalClasses[index].selected) {
              _controller.selectedClasses.value++;
            } else {
              _controller.selectedClasses.value--;
            }
            setState(() {});
          },
          child: Column(
            children: [
              Container(
                height: 200,
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: globalClasses[index].selected ? PRIMARY_COLOR : Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(globalClasses[index].image)
                  )
                ),
              ),
              Text(globalClasses[index].office,
                  style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400)),
              Row(
                children: [
                  Text("ATK: ${globalClasses[index].atk}",
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400)),
                  const SizedBox(width: 15,),
                  Text("HP: ${globalClasses[index].hp}",
                      style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400)),
                ],
              )
            ],
          ),
        );
      },
    );
  }
}
