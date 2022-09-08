import 'package:flutter/material.dart';
import 'package:flutter_app_1/helpers/database_helper.dart';
import 'package:flutter_app_1/models/cat_model.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen ({Key? key}): super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context){
    
    final textControllerRace = TextEditingController();
    final textControllerName = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('SQLite Example with Cats'), 
        elevation: 0),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            TextFormField(
              controller: textControllerRace, decoration: const InputDecoration(
                icon: Icon(Icons.view_comfortable),
                labelText: 'Input the race of cat'
              ) 
            ),
            TextFormField(
              controller: textControllerName, decoration: const InputDecoration(
                icon: Icon(Icons.text_format_outlined),
                labelText: 'Input the name of cat'
              ) 
            ),
            Center(
              child: (
                FutureBuilder<List<Cat>> (
                  future: DatabaseHelper.instance.getCats(),
                  builder: (BuildContext context, AsyncSnapshot<List<Cat>> snapshot) {
                    if(!snapshot.hasData){
                      return Center(
                        child: Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: const Text('Loading...'),
                        ),
                      );
                    }
                    else {
                      return snapshot.data!.isEmpty ? Center(child: Container(child: const Text('No cats in the list'))) :
                      ListView(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        children: snapshot.data!.map((cat) {
                            return Center(
                              child: ListTile(
                                title: Text(cat.name),
                              ),
                            );
                          }
                        ).toList()
                      );
                    }
                  },
                )
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: 
          Icon(Icons.save),
          onPressed: () async {
            DatabaseHelper.instance.add(
              Cat(race: textControllerRace.text, name: textControllerName.text)
            );
            setState(() {
                textControllerName.clear();
                textControllerRace.clear();
              }
            );
          },
        ),
    );
      }
}