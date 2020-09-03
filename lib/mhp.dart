import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


import 'service/api.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<dynamic> teams = List<dynamic>();

  bool isLoading = true;
  bool isStart = false;

  var colors = [];


  void _apiGet() {
    isStart = true;
    teams = [];
    colors = [];
    setState(() {
      isLoading = true;
    });
    setState(() async {
      teams = await Api().getTeams();
      _updatePalettes();
      setState(() {
      });
    });
  }

  _updatePalettes() async {
    for(var i = 0; i < teams.length; i++){
      final image = teams[i].strTeamBadge;
      final PaletteGenerator generator = await
          PaletteGenerator.fromImageProvider(
            NetworkImage('$image'),
            size: Size(200, 100)
          );
      colors.add(generator.lightVibrantColor != null ?
        generator.lightVibrantColor : PaletteColor(Colors.blue, 2));
    }
    setState(() {
      isLoading = false;
    });
  }

  Widget _listViewBuilder() {
    return ListView.builder(
        itemCount: teams.length,
        itemBuilder: (context, i) {
          final image = teams[i].strTeamBadge;
          final name = teams[i].strTeamName;
          final color = colors.isNotEmpty ? colors[i].color : Colors.deepPurpleAccent ;
          this.flag.add(false);
          final index = i;
          return Container(
            padding: EdgeInsets.only(
              top: 5,
            ),
            child: Card(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                        color: color,
                        width: 4,
                      )),
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
                              disabledColor: Colors.grey,
                              onChanged: (val) => setState(() {
                                this.flag[index] =
                                !this.flag[index];
                              })),
                        ),
                        Expanded(
                            flex: 2,
                            child: Container(
                                height: 50,
                                child: Image.network('$image',))),
                        Expanded(
                            flex: 6,
                            child: Text(
                              '$name',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.indigo),
                            )),
                      ],
                    )),
              ),
              elevation: 2.0,
            ),
          );
        });
  }

  Widget _loadingView() {

  }

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
        child: !isStart ? Text("Tekan Tombol Refresh") : Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 10,
          ),
          child: !isLoading ? _listViewBuilder() : SpinKitWave(
            color: Colors.deepPurpleAccent.withOpacity(0.7),
            size: 50.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Load',
        child: Icon(Icons.refresh),
        onPressed: _apiGet,
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}