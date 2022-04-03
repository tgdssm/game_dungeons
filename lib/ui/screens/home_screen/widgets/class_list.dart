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
      itemCount: _controller.classes.length,
      scrollDirection: Axis.horizontal,
      controller: _controller.scrollController,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: (){
            _controller.classes[index].selected = !_controller.classes[index].selected;
            if(_controller.classes[index].selected) {
              _controller.selectedClasses.value++;
            } else {
              _controller.selectedClasses.value--;
            }
          },
          child: Column(
            children: [
              Container(
                height: 200,
                width: 150,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey,
                  image: DecorationImage(
                    image: AssetImage(_controller.classes[index].image)
                  )
                ),
              ),
              Text(_controller.classes[index].office,
                  style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400)),
              // Row(
              //   children: [
              //     Text("ATK: ${_controller.nameClass(index)}",
              //         style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400)),
              //     Text("HP: ${_controller.nameClass(index)}",
              //         style: GoogleFonts.yanoneKaffeesatz(color: Colors.black, fontSize: 24, fontWeight: FontWeight.w400)),
              //
              //   ],
              // )
            ],
          ),
        );
      },
    );
  }
}
