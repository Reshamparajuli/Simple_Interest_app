import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  TextEditingController principalval = TextEditingController();
  TextEditingController rateval = TextEditingController();
  TextEditingController timeval = TextEditingController();

  String result = "";

  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Simple Interest"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                const Image(image: AssetImage("assets/images/si.png")),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: principalval,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return "Please Enter Principal";
                    }
                  }),
                  decoration: InputDecoration(
                    label: const Text("Principal"),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                          color: Colors.green,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: rateval,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please Enter Rate";
                          }
                        }),
                        decoration: InputDecoration(
                          label: const Text("Rate"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: timeval,
                        validator: ((value) {
                          if (value!.isEmpty) {
                            return "Please Provide Time";
                          }
                        }),
                        decoration: InputDecoration(
                          label: const Text("Time"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              if (formkey.currentState!.validate()) {
                                result = calculate();
                              }
                            });
                          },
                          child: Text("Calculate")),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            reset();
                          });
                        },
                        child: Text("reset")),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  result,
                  style: TextStyle(color: Colors.black, fontSize: 30),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  String calculate() {
    double principal = double.parse(principalval.text);
    double rate = double.parse(rateval.text);
    double time = double.parse(timeval.text);

    double result = ((principal * rate * time) / 100);

    String finalshow = "After $time years your interest will be $result";
    return finalshow;
  }

  void reset() {
    principalval.text = "";
    timeval.text = "";
    rateval.text = "";
    result = "";
  }
}
