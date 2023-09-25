import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController peso = TextEditingController();
  TextEditingController altura = TextEditingController();
  String infotext = '';
  void calcular() {
    double _peso = double.parse(peso.text);
    double _altura = double.parse(altura.text);

    double imc = _peso / (pow(_altura, 2));

    infotext = imc.toStringAsPrecision(2);
    setState(() {
      if (imc <= 16) {
        infotext = 'MAGREZA GRAVE: ' + imc.toStringAsPrecision(4);
      } else if (imc == 16 || imc < 17) {
        infotext = 'MAGREZA MODERADA: ' + imc.toStringAsPrecision(4);
        ;
      } else if (imc == 17 || imc <= 18.5) {
        infotext = 'MAGREZA LEVE: ' + imc.toStringAsPrecision(4);
        ;
      } else if (imc == 18.5 || imc <= 20) {
        infotext = 'SAUDAVÉL: ' + imc.toStringAsPrecision(4);
        ;
      } else if (imc == 25 || imc < 30) {
        infotext = 'SOBREPESO: ' + imc.toStringAsPrecision(4);
        ;
      } else if (imc == 30 || imc < 35) {
        infotext = 'OBESIDADE GRAU I: ' + imc.toStringAsPrecision(4);
      } else if (imc == 35 || imc < 40) {
        infotext = 'OBESIDADE GRAU II (SEVERA): ' + imc.toStringAsPrecision(4);
      } else if (imc >= 45) {
        infotext =
            'OBESIDADE GRAU III (MORBITA): ' + imc.toStringAsPrecision(4);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CALCULADORA DE IMC'),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.blueGrey,
          child: ListView(
            padding: EdgeInsets.all(22),
            children: [
              Container(
                child: TextField(
                    controller: peso,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'DIGITE SEU PESO (KG)',
                        labelStyle: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: TextField(
                    controller: altura,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'DIGITE SUA ALTURA',
                        labelStyle: TextStyle(color: Colors.white))),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ElevatedButton(
                    onPressed: () {
                      calcular();
                    },
                    child: Text('CALCULAR IMC')),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Seu IMC É:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Text(
                infotext,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.redAccent,
                    fontWeight: FontWeight.bold),
              ),
             
             
            ],
          ),
        ));
  }
}
