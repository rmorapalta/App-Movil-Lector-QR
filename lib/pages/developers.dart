import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';
import 'package:proyect_movil_app/pages/developers/luis.dart';
import 'package:proyect_movil_app/pages/developers/rodrigo.dart';
import 'package:proyect_movil_app/pages/developers/andres.dart';



class DevPage extends StatefulWidget {
  const DevPage({Key? key}) : super(key: key);

  @override
  State<DevPage> createState() => _DevPageState();
}

class _DevPageState extends State<DevPage> {
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
                "Desarrolladores",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                  color: Colors.white70,
                ),
              ),
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
                "Luis Rivas Sanchez",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/luis.png",
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                child: const Text('Mas Info', style: TextStyle(fontSize: 16.0),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LuisPage()),
                  );
                },
              ),
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
                  fontSize: 20,
                  color: Colors.white70,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
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
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                child: const Text('Mas Info', style: TextStyle(fontSize: 16.0),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RodrigoPage()),
                  );
                },
              ),
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
                "Andres Segarra Pavez",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white70,
    ),
                ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Align(
              alignment: Alignment.center,
              child: Image.asset(
                "assets/images/segarra.png",
                width: 120,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: 110,
              child: ElevatedButton(
                child: const Text('Mas Info', style: TextStyle(fontSize: 16.0),),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RodrigoPage()),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.center,
                child: Center(
                  child: SizedBox(
                    width: 60,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                          context,

                        );
                      },
                      child: Image.asset(
                        "assets/images/flecha.png",
                        width: 300,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],

      ),
    );
  }
}

