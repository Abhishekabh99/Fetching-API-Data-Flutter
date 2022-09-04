import 'package:flutter/material.dart';
import 'package:mm1/models/model2.dart';

import 'package:mm1/services/models_services.dart';

import '../models/model2.dart';

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  Widget DetailUI(Model2 store) {
    return Column(
      children: [
        SizedBox(
            height: 210,
            width: double.infinity,
            child: Card(
                shape: RoundedRectangleBorder(),
                color: Colors.grey,
                child: Image.network(store.image ?? ""))),
        SizedBox(
          height: 80,
          child: Card(
            //  color: Color(0xFFFFB6C1),
            //  shape: RoundedRectangleBorder(),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                      // border: Border.all(
                      //    width: 1, //                   <--- border width here
                      //   ),
                      ),
                  height: 40,
                  width: 40, //container for icon
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Image.network(store.brand?.icon ?? ""),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 0, top: 15),
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ' ${store.name}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              ' ${store.brand?.name}',
                              style: TextStyle(
                                  color: Color(0XFF5B5959),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        /*   Text('name : ${store.name}'),
        Text('my id is vehicle id : ${store.id}'),
        Text('asasasa : ${store.loan?.downpayment ?? " no data"}'),*/
        SizedBox(
          height: 150,
          width: double.infinity,
          child: Card(
              //color: Color(0xFFFFB6C1),
              // shape: RoundedRectangleBorder(
              // side: BorderSide(color: Colors.yellow, width: 2)),
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text('Retail Price'),
              ),
              Text(
                '₹ ${store.price}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text(
                  'Loan Available',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Text(
                'From ${store.loan?.edi} per day',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                'Conditions  Apply',
                style: TextStyle(fontSize: 12),
              ),
            ],
          )),
        ),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: Card(
            //color: Color(0xFFFFB6C1),
            // shape: RoundedRectangleBorder(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5, left: 8),
                  child: Text(
                    'Interested in this E-Rickshaw?',
                    style: TextStyle(
                        color: Color(0xFF5B5959),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3, left: 8),
                  child: Text(
                    'Share your details',
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 135,
          width: double.infinity,
          child: Card(
            //color: Color(0xFFFFB6C1),
            // shape: RoundedRectangleBorder(),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: SizedBox(
                  height: 30,
                  width: 300,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, height: 0),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter full name',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: SizedBox(
                  height: 30,
                  width: 300,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.center,
                    textAlign: TextAlign.left,
                    maxLines: 1,
                    style: TextStyle(fontSize: 12, height: 0),
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter 10 digit phone number',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 30,
                  width: 200,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF7B7B7B))),
                    onPressed: () {},
                    child: const Text('Submit'),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: FutureBuilder<Model2?>(
            future: ModelsService.getAll2(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                Model2 models2 = snapshot.data!;
                return DetailUI(models2);
              } else {
                return Text('cant Load Data');
              }
            }),
      ),
    );
  }
}
