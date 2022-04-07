import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final _controllerWeight = TextEditingController();
  final _controllerHeight = TextEditingController();
  final fieldText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/bg1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(width: 8.0),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('              BMI',
                                      style: TextStyle(
                                          fontSize: 36.0,
                                          color: Colors.pink.withOpacity(1))),
                                  Text(
                                    '      CALCULATOR',
                                    style: TextStyle(
                                      fontSize: 36.0,
                                      color: Colors.pink.withOpacity(1),
                                    ),
                                  ),
                                  Image.asset(
                                    'images/bmi.png',
                                    width: 300,
                                  ),
                                ],
                              ),
                            ])),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(width: 8.0),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                elevation: 50,
                                child: SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.45,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'WEIGHT',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const Text(
                                          '(kg.)',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: _controllerWeight,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter weight',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 50,
                                child: SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width * 0.45,
                                  height: 200,
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Column(
                                      children: [
                                        const Text(
                                          'HEIGHT',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        const Text(
                                          '(cm)',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: TextField(
                                            textAlign: TextAlign.center,
                                            controller: _controllerHeight,
                                            decoration: const InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              border: OutlineInputBorder(),
                                              hintText: 'Enter height',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: ElevatedButton(
                        child: const Text('BMI CALCULATE'),
                        onPressed: () {
                          var inputWeight = _controllerWeight.text;
                          var inputHeight = _controllerHeight.text;

                          var weight = double.tryParse(inputWeight);
                          var height = double.tryParse(inputHeight);

                          if (weight == null || height == null) {
                            print(
                                "กรอกข้อมูลไม่ถูกต้อง ให้กรอกเฉพาะตัวเลขเท่านั้น");
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('ERROR',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold)),
                                    content: const Text('Invalid input'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          } else {
                            var bmi =
                                weight / ((height / 100) * (height / 100));
                            var body = "";
                            if (bmi < 18.5) {
                              body = "น้ำหนักต่ำกว่าเกณฑ์";
                            } else if (bmi <= 22.9) {
                              body = "สมส่วน";
                            } else if (bmi <= 24.9) {
                              body = "น้ำหนักเกิน";
                            } else if (bmi <= 29.9) {
                              body = "โรคอ้วน";
                            } else {
                              body = "โรคอ้วนอันตราย";
                            }

                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Row(children: const [
                                      Image(
                                        image: NetworkImage(
                                            'https://c.tenor.com/JvArM7ZO5JIAAAAM/bavatogay-ricardo-milos.gif'),
                                        width: 40,
                                      ),
                                      Text('            RESULT',
                                          style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold))
                                    ]),
                                    content: Text(
                                        'BMI: ${bmi.toStringAsFixed(2)}  \n อยู่ในช่วง: $body'),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: const Text('OK'))
                                    ],
                                  );
                                });
                          }
                        },
                      ),
                    )
                  ],
                ))));
  }
}