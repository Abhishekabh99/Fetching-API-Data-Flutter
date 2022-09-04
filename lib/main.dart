import 'package:flutter/material.dart';
import 'package:mm1/models/models.dart';
import 'package:mm1/pages/page1.dart';
import 'package:mm1/services/models_services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select Your E-Rickshaw'),
          backgroundColor: Colors.grey,
        ),
        body: Container(
            child: FutureBuilder<List<Model>>(
                future: ModelsService.getAll(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Model> models = snapshot.data!;
                    return ListView.builder(
                        itemCount: models.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 32, bottom: 32, left: 16, right: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        models[index].id!.toString(),
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        '.',
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Page1()),
                                          );
                                        },
                                        child: Text(
                                          models[index].name!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    models[index].brand!,
                                    style:
                                        TextStyle(color: Colors.grey.shade600),
                                  ),
                                  Row(children: [
                                    Text(
                                      'Price : ',
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                    Text(
                                      models[index].price!.toString(),
                                      style: TextStyle(
                                          color: Colors.grey.shade600),
                                    ),
                                  ]),
                                ],
                              ),
                            ),
                          );
                        });
                  }
                  if (snapshot.hasError) {
                    print(snapshot.error);
                  }
                  return Center(child: CircularProgressIndicator());
                })),
      ),
    );
  }
}
