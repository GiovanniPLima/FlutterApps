import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController qttPessoas = TextEditingController();
  TextEditingController conta = TextEditingController();
  String _valorPessoa = "Informe seus Dados";
  void Calcular() {
    double qtt = double.parse(qttPessoas.text);
    double ct = double.parse(conta.text);
    double valorDivido = ct / qtt;
    setState(() {
      print(valorDivido);
    });
    _valorPessoa = "Valor por Pessoa é: ${valorDivido.toStringAsPrecision(3)}";
  }

  void _limparCampos() {
    setState(() {
      _valorPessoa = "Informe seus Dados";
      qttPessoas.text = "";
      conta.text = "";
    });
  }

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text("Racha Conta"),
            centerTitle: true,
            actions: <Widget>[
              IconButton(
                  onPressed: () {
                    _limparCampos();
                  },
                  icon: Icon(Icons.refresh))
            ]),
        body: SingleChildScrollView(
            child: Padding(
          padding: EdgeInsets.all(20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.monetization_on,
                  size: 120,
                  color: Colors.green,
                ),
                TextFormField(
                    controller: qttPessoas,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Quantidade de Pessoas",
                        labelStyle: TextStyle(color: Colors.blue)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Preencha Todos os Campos";
                      }
                    }),
                TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return " Preencha Todos os Campos";
                      }
                    },
                    controller: conta,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Valor da Conta",
                        labelStyle: TextStyle(color: Colors.blue)),
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: Container(
                      height: 40,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Calcular();
                            }
                          },
                          child: Text(
                            "Calcular",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ))),
                ),
                Text(_valorPessoa)
              ],
            ),
          ),
        )));
  }
}
