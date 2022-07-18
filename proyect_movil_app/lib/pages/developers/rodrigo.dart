import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:proyect_movil_app/pages/developers.dart';



class RodrigoPage extends StatefulWidget {
  const RodrigoPage({Key? key}) : super(key: key);

  @override
  State<RodrigoPage> createState() => _RodrigoPageState();
}

class _RodrigoPageState extends State<RodrigoPage> {
  bool isAPIcallProcess = false;
  bool hidePassword = true;
  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child:Scaffold(
        backgroundColor: HexColor("#283B71"),
        body: ProgressHUD(
          inAsyncCall: isAPIcallProcess,
          opacity: 0.3,
          key: UniqueKey(),
          child:Form(
            key: globalFormKey,
            child: _loginUI(context),
          ),
        ),
      ),
    );
  }

  SingleChildScrollView _loginUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 7.2,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.white,
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Utem.png",
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 2,
              bottom: 5,
              top: 30,
            ),
            child: Center(
              child: Text(
                "Rodrigo Mora Palta",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/mora.png",
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Center(child: Text("Rodrigo Mora Palta",style: TextStyle(fontSize: 20.0, color: Colors.white70))),
          const Center(child: Text("rmora@utem.cl",style: TextStyle(fontSize: 20.0, color: Colors.white70))),
          const SizedBox(
            height: 10,
          ),
          const Center(
            child: SizedBox(
              height: 150,
              width: 250,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 2,
                    bottom: 5,
                    top: 30,
                  ),
                  child: Center(
                    child: Text(
                      "Estudiante que cursa el ramo de Paralela y Computacion Distruibuida, se llego a comprender en cierta medida el uso de distintas herramientas bajo el entorno de flutter.",
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,
                        );
                      },
                      child: Image.asset(
                        "assets/images/flecha.png",
                        width: 200,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(
                  "assets/images/inicio.png",
                  width: 250,
                  height: 100,
                  fit: BoxFit.contain,
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}