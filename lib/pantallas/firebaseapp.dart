import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_firebaseapp/services/firebase.dart';
import 'package:flutter_firebaseapp/pantallas/update_usuer.dart';

class FireBaseAPP extends StatefulWidget {
  const FireBaseAPP({super.key});

  @override
  State<FireBaseAPP> createState() => _FireBaseAPPState();
}

class _FireBaseAPPState extends State<FireBaseAPP> {
  @override
  //_llave =UniqueKey();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FIREBASE'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: FutureBuilder(
          future: getUsuarios(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: ((context, index) {
                    //return Text(snapshot.data?[index]['nombre']);
                    return Dismissible(
                      confirmDismiss: (direction) async {
                        print("Confirmacion de borrado");
                        eliminar(snapshot.data?[index]['id'], 'usuarios');
                        return true;
                      },
                      background: Container(
                        color: (Colors.red),
                        child: const Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: UniqueKey(),
                      //Key(Text(snapshot.data?[index]['uid']))
                      child: ListTile(
                        title: Text(snapshot.data?[index]['nombre']),
                        onTap: (() async {
                          await Navigator.pushNamed(context, '/edit',
                              arguments: {
                                'nombre': snapshot.data?[index]['nombre'],
                                'id': snapshot.data?[index]['id'],
                              });
                          setState(() {});
                        }),
                      ),
                    );
                    //print("datos");
                  }));
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
          //print("Actualizar");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
