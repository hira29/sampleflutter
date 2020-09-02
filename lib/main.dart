import 'package:flutter/material.dart';
import 'data.dart';
import 'package:circular_check_box/circular_check_box.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Sample',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Sample App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Data> today = [
    Data(select: false, time: '07.00 AM', activity: 'Go jogging with Christin', color: Colors.yellow),
    Data(select: false, time: '08.00 AM', activity: 'Send project file', color: Colors.greenAccent),
    Data(select: false, time: '10.00 AM', activity: 'Meeting with client', color: Colors.pink),
    Data(select: false, time: '13.00 PM', activity: 'Email client', color: Colors.greenAccent)
  ];

  List<Data> tomorrow = [
    Data(select: false, time: '07.00 AM', activity: 'Go jogging with Christin', color: Colors.yellow),
    Data(select: false, time: '08.00 AM', activity: 'Send project file', color: Colors.greenAccent),
  ];

  bool selected = false;

  List<bool> flag = [];
  List<Color> button = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: ListView.builder(
            itemCount: today.length + tomorrow.length + 2,
              itemBuilder: (context, i) {
              if (i == 0) {
                return Container(
                  padding: EdgeInsets.only(left: 5, top: 10, bottom: 5),
                    child: Text(
                        "Today",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                              color: Colors.blueGrey
                      ),
                    )
                );
              } else if (i == today.length + 1) {
                return Container(
                    padding: EdgeInsets.only(left: 5, top: 20, bottom: 5),
                    child: Text(
                      "Tomorrow",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    )
                );
              } else if ( i > 0 && i <= today.length) {
                final time = today[i-1].time;
                final activity = today[i-1].activity;
                final color = today[i-1].color;
                this.flag.add(false);
                this.button.add(Colors.grey.withOpacity(0.8));
                final index = i-1;
                return Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: color,width: 4,)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: CircularCheckBox(
                                    value: this.flag[index],
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey,
                                    disabledColor: Colors.grey ,
                                    onChanged: (val) => setState(() {
                                      this.flag[index] = !this.flag[index] ;
                                    })
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text('$time',
                                    style: TextStyle(
                                      fontSize: 11,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.blueGrey.withOpacity(0.7)),
                                  )
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text('$activity',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  )
                              ),
                              Expanded(
                                  flex: 1,
                                  child: new IconButton(
                                      icon: Icon(Icons.alarm,
                                        color: this.button[index],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (this.button[index] == Colors.grey.withOpacity(0.8)) {
                                            this.button[index] = Colors.orangeAccent;
                                          } else {
                                            this.button[index] = Colors.grey.withOpacity(0.8);
                                          }
                                        });
                                      })
                              )
                            ],
                          )
                      ),
                    ),
                    elevation: 2.0,
                  ),
                );
              } else {
                final time = tomorrow[i-today.length-2].time;
                final activity = tomorrow[i-today.length-2].activity;
                final color = today[i-today.length-2].color;
                this.flag.add(false);
                this.button.add(Colors.grey.withOpacity(0.8));
                final index = i-2;
                return Container(
                  padding: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Card(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border(left: BorderSide(color: color,width: 4,)),
                      ),
                      child: Padding(
                          padding: EdgeInsets.all(5),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: CircularCheckBox(
                                    value: this.flag[index],
                                    checkColor: Colors.white,
                                    activeColor: Colors.green,
                                    inactiveColor: Colors.grey,
                                    disabledColor: Colors.grey ,
                                    onChanged: (val) => setState(() {
                                      this.flag[index] = !this.flag[index] ;
                                    })
                                ),
                              ),
                              Expanded(
                                  flex: 2,
                                  child: Text('$time',
                                    style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.blueGrey.withOpacity(0.7)),
                                  )
                              ),
                              Expanded(
                                  flex: 3,
                                  child: Text('$activity',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.indigo),
                                  )
                              ),
                              Expanded(
                                  flex: 1,
                                  child: new IconButton(
                                      icon: Icon(Icons.alarm,
                                        color: this.button[index],
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          if (this.button[index] == Colors.grey.withOpacity(0.8)) {
                                            this.button[index] = Colors.orangeAccent;
                                          } else {
                                            this.button[index] = Colors.grey.withOpacity(0.8);
                                          }
                                        });
                                      })
                              )
                            ],
                          )
                      ),
                    ),
                    elevation: 2.0,
                  ),
                );
              }
            }
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   tooltip: 'Increment',
      //   child: Icon(Icons.accessibility),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
