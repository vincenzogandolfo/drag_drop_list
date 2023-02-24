import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Elenco delle Tessere
  final List listaTessere = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
  ];

  // Funzione che Sposta le Tessere
  void updateListaTessere(int oldIndex, int newIndex) {
    setState(() {
      // Quando sposto un Elemento in Fondo alla Lista
      // Tutti quelli Sopra si Spostano verso l'Alto
      if (oldIndex < newIndex) {
        newIndex--;
      }
      // Elemento che si Sposta
      final tessera = listaTessere.removeAt(oldIndex);
      // Nuova posizione dell'Elemento
      listaTessere.insert(newIndex, tessera);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade300,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent.shade700,
        title: const Center(
          child: Text('Drag Drop List'),
        ),
      ),
      body: ReorderableListView(
        onReorder: (oldIndex, newIndex) =>
            updateListaTessere(oldIndex, newIndex),
        children: [
          for (final tessera in listaTessere)
            Container(
              height: 50,
              width: double.infinity,
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blueAccent,
              ),
              key: ValueKey(tessera),
              // Struttura Tessere
              child: ListTile(
                title: Center(
                  child: Text(
                    tessera,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
