import 'package:custom_dropdown_example/DropdownButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.purple,
          ),
        ),
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  //Globay key to control dropdown
  GlobalKey<CustomDropdownButtonState<dynamic>> dropdownKey = GlobalKey<CustomDropdownButtonState<dynamic>>();

  List<String> _dropdowntems = ['Volvo XC90','Saab 95','Mercedes SLK','Audi TT'];
  var value;
  IconData icon = Icons.keyboard_arrow_down;

  void _openDropdown() {
    setState(() {
      icon = icon == Icons.keyboard_arrow_down ? Icons.keyboard_arrow_up: Icons.keyboard_arrow_down; // Change icon and setState to rebuild
    });

    //this is magic
    CustomDropdownButtonState? state = dropdownKey.currentState;
    state!.callTap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Dropdown Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 25,right: 25),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(10),  boxShadow: [
                  BoxShadow(color: Colors.black26, spreadRadius: 1, blurRadius: 0.5),
                ], ),
                // dropdown below..
                child: ButtonTheme(
                  alignedDropdown: true,
                  child: CustomDropdownButtonHideUnderline(
                    child: CustomDropdownButton<String>(
                      key: dropdownKey,
                      value: value ,
                      hint: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Choose a car",
                          )),
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Color(0xFFA2ADB8),
                      ),
                      iconSize: 25,
                      underline: SizedBox(),
                      isExpanded: true,
                      onChanged: (selectedValue) async {
                      setState(() {
                        value = selectedValue;
                      });
                      },
                      items: _dropdowntems.map(
                            (val) {
                          return CustomDropdownMenuItem<String>(
                            value: val,
                            child: Text(val),
                          );
                        },
                      ).toList(),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openDropdown,
        tooltip: 'OpenDropdown',
        child: Icon(icon),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


}
