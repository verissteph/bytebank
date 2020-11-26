
import 'package:bytebank/components/campo_texto.dart';
import 'package:bytebank/models/transferencia.dart';
import 'package:flutter/material.dart';


class Formulario extends StatefulWidget {
  final TextEditingController controladorDoCampoConta = TextEditingController();
  final TextEditingController controladorDoCampoValor = TextEditingController();
  @override
  State<StatefulWidget> createState() {
    return FormularioState();
  }
  void criaTransferencia(BuildContext context) {
    debugPrint('Clicou em ADICIONAR');
    int conta = int.tryParse(controladorDoCampoConta.text);
    double valor = double.tryParse(controladorDoCampoValor.text);
    if (conta != null && valor != null) {
      final transferenciaCriada = Transferencia(valor, conta);
      debugPrint('Transferência criada: $transferenciaCriada');
      Navigator.pop(context, transferenciaCriada);
    }
  }
}
class FormularioState extends State<Formulario>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Transferencia'),
      ),
      body: Column(
        children: [
          CampoTexto(
            controlador: widget.controladorDoCampoConta,
            rotulo: 'Numero da conta',
            dica: '0000',
          ),
          CampoTexto(
            rotulo: 'Valor',
            dica: '0.00',
            icone: Icons.monetization_on,
            controlador: widget.controladorDoCampoValor,
          ),
          RaisedButton(
            onPressed: () {
              widget.criaTransferencia(context);
            },
            child: Text('Adicionar'),
          ),
        ],
      ),
    );
  } // build
}