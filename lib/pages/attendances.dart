import 'package:flutter/material.dart';
import 'package:proyect_movil_app/models/rest_consumer.dart';

class AttendancesPage extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Estudiante',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text('Estudiante')
            ),
            body: ListView(
              children: Student.map(_buildItem).toList(),
            )
        )
    );
  }
}

Widget _buildItem(Student student) {
  return ListTile(
    title: Text(student.classroom),
    subtitle: Text('Curso: ${student.subject}'),
    trailing: Text('Entrada: ${student.entrance}'),
    leading: Text('Salida: ${student.leaving}'),
    onTap: (){
      print(student.classroom);
    },
  );
}



