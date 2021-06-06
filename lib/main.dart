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
  String _valorPessoa = "";
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
      _valorPessoa = "";
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
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: TextFormField(
                          controller: qttPessoas,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            hintText: "Quantidade de Pessoas",
                          ),
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Preencha Todos os Campos";
                            }
                          })),
                ),
                Container(
                    decoration: BoxDecoration(
                        border: Border.all(width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return " Preencha Todos os Campos";
                          }
                        },
                        controller: conta,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Valor da Conta",
                        ),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.blue, fontSize: 18))),
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
