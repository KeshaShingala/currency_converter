import 'package:flutter/material.dart';

import '../globals/global.dart';
import '../globals/global_1.dart';
import '../helpers/api_helper.dart';
import '../modals/converter_modal.dart';

class secondpage extends StatefulWidget {
  const secondpage({Key? key}) : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  int val1 = 139;
  int val2 = 55;
  int temp = 1;
  double amt = 1;
  String error = "No";
  TextEditingController numberController = TextEditingController();

  initState() {
    super.initState();
    numberController.text = amt.toInt().toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Currency Converter",
          style: TextStyle(color: Colors.grey.shade400),
        ),
        centerTitle: true,
        actions: [],
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "From",
                style: TextStyle(
                    color: Colors.cyan.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xff484858),
                          )),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: val1,
                          items: allCurrencies
                              .map((e) => DropdownMenuItem(
                                    value: allCurrencies.indexOf(e),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (int? value) {
                            setState(() {
                              val1 = value!;
                            });
                          },
                          dropdownColor: Colors.black38,
                          style: const TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.white,
                          icon: const Icon(Icons.location_on,
                              color: Colors.greenAccent),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "To",
                style: TextStyle(
                    color: Colors.cyan.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: const Color(0xff484858),
                          )),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(10),
                          isExpanded: true,
                          value: val2,
                          items: allCurrencies
                              .map((e) => DropdownMenuItem(
                                    value: allCurrencies.indexOf(e),
                                    child: Text(
                                      e,
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (int? value) {
                            setState(() {
                              val2 = value!;
                            });
                          },
                          dropdownColor: Colors.black38,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.blue,
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Amount",
                style: TextStyle(
                    color: Colors.cyan.shade200,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(
                      color: const Color(0xff484858),
                    )),
                child: Center(
                  child: TextField(
                    onSubmitted: (val) {
                      setState(() {
                        amt = double.parse(val);
                      });
                    },
                    controller: numberController,
                    style: TextStyle(color: Colors.grey),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter valid amount...",
                        border: InputBorder.none,
                        errorText: (numberController.text.contains(","))
                            ? "Enter valid amount."
                            : null),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              FutureBuilder(
                future: CarrAPIHelper.currAPIHelper.fetchingUserData(
                    From: currVal[val1],
                    To: currVal[val2],
                    amount: amt,
                    error: error),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text(
                      "slow or no internet connection\ncheck your connection or try again",
                      style: TextStyle(fontSize: 20, color: Colors.red),
                    );
                  } else if (snapshot.hasData) {
                    CurrData? data = snapshot.data as CurrData?;

                    return Padding(
                      padding: const EdgeInsets.all(18),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Result :- ",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "${amt} ${currVal[val1]}",
                                style: TextStyle(
                                    color: Colors.red.shade200,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text("=",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 30)),
                          const SizedBox(height: 10),
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Center(
                              child: Text(
                                "${data!.data} ${currVal[val2]}",
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 35),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              )
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
