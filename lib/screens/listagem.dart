import 'package:bytebank/components/item.dart';
import 'package:bytebank/models/transferencia.dart';
import 'file:///C:/Users/stephanie.v.pinheiro/Desktop/Flutter/bytebank/lib/screens/formulario.dart';
import 'package:flutter/material.dart';



class  ListaTransferencias  extends  StatefulWidget{
  final List<Transferencia> transferencias = List();

  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}
class ListaTransferenciasState extends State<ListaTransferencias>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Transferências'),),
      body: ListView.builder(
        itemCount:   widget.transferencias.length,
        itemBuilder: (BuildContext context,  int index){
          final Transferencia transferencia =   widget.transferencias[index];
          return ItemDeTransferencia(transferencia);
        },
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: () {
          Future<Transferencia> futuro = Navigator.push(context, MaterialPageRoute(builder: (ctx){
            return Formulario();

          }));
          futuro.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget.transferencias.add(transferenciaRecebida);
                debugPrint('Lista atualizada: ' +
                    widget.transferencias.length.toString());
              });

            }
          }
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}