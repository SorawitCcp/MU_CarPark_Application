import 'package:flutter/material.dart';

void main() {
  // runApp() is a builtin method that initializes the app layout
  // MyApp() (see below) is a widget that will be the root of our application.
  runApp(ParkingLots());
}

// the root widget of our application
class ParkingLots extends StatelessWidget {
// The build method rebuilds the widget tree if there are any changes
// and allows hot reload to work.
  @override

  Widget build(BuildContext context) {

// This time instead of using a Container we are using the MaterialApp
// widget, which is setup to make our app have the Material theme.
    return MaterialApp(
      debugShowCheckedModeBanner: false,
// The Scaffold widget lays out our home page for us
      home: Scaffold(
// We will pass an AppBar widget to the appBar property of Scaffold
        appBar: AppBar(
          backgroundColor: Colors.yellow[600],
// The AppBar property takes a Text widget for its title property
          title: Text("Car Park Booking",),

        ),

// The body property of the Scaffold widget is the main content of
// our screen. Instead of directly giving it a widget we are going
// to break it out into another method so that things don't get
// too messy here.
        body: BodyLayout(),
      ),
    );
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}


// This is where we will play with the Text widget
/*Widget myWidget() {
  return RaisedButton(
    child: const Text('Button'),
    color: Colors.blue,
    elevation: 4.0,
    splashColor: Colors.yellow,

    onPressed: () {
      print("You press button");
    },
  );
}*/

/*Widget myWidget() {
  return ListView.builder(
    padding: EdgeInsets.all(16.0),
    itemCount: 10,
// spacing of the rows
    itemExtent  : 30.0,
// provides an infinite list
    itemBuilder: (BuildContext context, int index) {
      return Text('Row $index');
    },
  );
}*/

/*Widget myWidget() {
  int i = 10;
  return ListView.builder(
    itemExtent: 100.0,
    itemCount: 10,
    itemBuilder: (BuildContext context, i) {
      return ListTile(
        title: Image.network('https://mahidol.ac.th/temp/2019/06/Logo2.png'),
        onTap: () {
          print("User press Raw $i");
        },
      );
    },
  );
}*/

Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot.png'),
        ),
        title: Text('A1'),
        subtitle: Text('Floor: 1st, Roof: No'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot.png'),
        ),
        title: Text('A2'),
        subtitle: Text('Floor: 1st, Roof: No'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot.png'),
        ),
        title: Text('A3'),
        subtitle: Text('Floor: 1st, Roof: No'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot.png'),
        ),
        title: Text('A4'),
        subtitle: Text('Floor: 1st, Roof: No'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot.png'),
        ),
        title: Text('A5'),
        subtitle: Text('Floor: 1st, Roof: No'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot_Roof.png'),
        ),
        title: Text('B1'),
        subtitle: Text('Floor: 1st, Roof: Yes'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot_Roof.png'),
        ),
        title: Text('B2'),
        subtitle: Text('Floor: 1st, Roof: Yes'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot_Roof.png'),
        ),
        title: Text('B3'),
        subtitle: Text('Floor: 1st, Roof: Yes'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot_Roof.png'),
        ),
        title: Text('B4'),
        subtitle: Text('Floor: 1st, Roof: Yes'),
      ),
      ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage('assets/images/Parkinglot_Roof.png'),
        ),
        title: Text('B5'),
        subtitle: Text('Floor: 1st, Roof: Yes'),
      ),
    ],
  );
}