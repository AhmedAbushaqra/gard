import 'package:gard/category.dart';
import 'package:flutter/material.dart';
import 'package:gard/models/chainModel.dart';
import 'package:gard/provider/ChainProvider.dart';
import 'package:gard/selectItem.dart';
import 'package:provider/provider.dart';

//https://script.google.com/macros/s/AKfycbyeaJJtVRgXqEqJrW0VPzhhSfdjzGvbJSGLLE05gF858bR-Vp5UFRR__Q/exec

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Chains>(
      create: (context)=>Chains(),
      child: MaterialApp(
        home: Home(),
        routes: {
          category.RouteName:(ctx)=>category(),
          //selectItem.RouteName:(ctx)=>selectItem(),
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.3,
            child: ListView(
              children: [
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Chain',
                      labelStyle: Theme
                          .of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black, fontSize: 18),
                      border: const OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Consumer<Chains>(
                        builder: (_, provider, __) {
                          return DropdownButton<String>(

                            /// place dropdown
                            hint: Text('Select Place'),
                            value: provider.selectedPlace,
                            isExpanded: true,
                            items: provider.places.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: provider.onChangedCallback,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  height: 65,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Branch',
                      labelStyle: Theme
                          .of(context)
                          .primaryTextTheme
                          .caption
                          .copyWith(color: Colors.black, fontSize: 18),
                      border: OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: Consumer<Chains>(
                        builder: (_, provider, __) {
                          return DropdownButton<String>(

                            /// branch dropdown
                            hint: Text('Select branch'),
                            isExpanded: true,
                            value: provider.selectedBranch,
                            items: provider.branches.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            onChanged: provider.setSelectedBranch,
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(category.RouteName);
        },
        icon: Icon(Icons.save),
        label: Text("Save"),
      ),
    );
  }
}