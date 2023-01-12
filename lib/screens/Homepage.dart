import 'package:curancy_converter_app/screens/secondpage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  logicIntro() async {
    final prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();
    logicIntro();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const secondpage())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 700,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(200),
                    bottomLeft: Radius.circular(50)),
                color: Colors.black),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      "assets/exchange-currency-converter-3589344-3053652.png",
                    )),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "  Easy",
                  style: TextStyle(fontSize: 50, color: Colors.greenAccent),
                ),
                Text(
                  "  Way to",
                  style: TextStyle(fontSize: 50, color: Colors.white),
                ),
                Row(
                  children: [
                    Text(
                      "  Convert ",
                      style: TextStyle(fontSize: 50, color: Colors.greenAccent),
                    ),
                    Text(
                      " in",
                      style: TextStyle(fontSize: 50, color: Colors.white),
                    ),
                  ],
                ),
                Text(
                  "  Currency",
                  style: TextStyle(fontSize: 50, color: Colors.greenAccent),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 2,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    height: 80,
                    width: 150,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40)),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 65,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.redAccent.shade200,
                              borderRadius: BorderRadius.circular(40)),
                          child: Image.asset("assets/curruncy.png"),
                        ),
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 80,
                width: 150,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(40)),
                child: Row(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 65,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Colors.greenAccent,
                          borderRadius: BorderRadius.circular(40)),
                      child: Image.asset("assets/curruncy.png"),
                    ),
                  ],
                )),
          ),
          // SizedBox(height: 10,),
        ],
      ),
      backgroundColor: Colors.cyan.shade100,
    );
  }
}
