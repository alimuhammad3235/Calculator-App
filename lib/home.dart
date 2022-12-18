import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyCall extends StatefulWidget {
  const MyCall({super.key});

  @override
  State<MyCall> createState() => MyCallState();
}

class MyCallState extends State<MyCall> {
  var result = "";
  var textt = "";
  clear() {
    setState(() {
      result = "";
    });
  }

  equal() {
    Parser p = Parser();
    Expression exp = p.parse(result);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      result = eval.toString();
    });
  }

  Widget mybtn(var textt, {Color? clrr = Colors.grey}) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          result = result + textt;
        });
      },
      child: Text(
        textt,
        style: TextStyle(fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: clrr,
        fixedSize: const Size(50, 65),
        shape: const CircleBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50),
            child: Text(
              result,
              style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    clear();
                  },
                  child: Text(
                    "AC",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(50, 65),
                    shape: const CircleBorder(),
                  ),
                ),
                mybtn("+/-"),
                mybtn("%"),
                mybtn("/", clrr: Color(0xffffa00a)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybtn("7"),
                mybtn("8"),
                mybtn("9"),
                mybtn('*', clrr: Color(0xffffa00a)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybtn("4"),
                mybtn("5"),
                mybtn("6"),
                mybtn("-", clrr: Color(0xffffa00a)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybtn("1"),
                mybtn("2"),
                mybtn("3"),
                mybtn("+", clrr: Color(0xffffa00a)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                mybtn("0"),
                mybtn("."),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = result.substring(0, result.length - 1);
                    });
                  },
                  child: Text(
                    "DEL",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: const Size(50, 65),
                    shape: const CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    equal();
                  },
                  child: Text(
                    "=",
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xffffa00a),
                    fixedSize: const Size(50, 65),
                    shape: const CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
