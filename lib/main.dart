import 'package:flutter/material.dart';

void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      theme: ThemeData(
          primarySwatch: Colors.teal
      ),
    );
  }
}
class LoginPage extends StatefulWidget {
  @override
  State createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = AnimationController(
        vsync: this, duration: Duration(milliseconds:500));
    _iconAnimation = CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.linear);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      //to avoid bottom overflowed when keypad is enabled
      appBar: AppBar(
        title: Text("Was   If"),
        centerTitle: true,
      ),
      backgroundColor: Colors.black26,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset("assets/wasifbackground.jpg",
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken),
          Container(padding: EdgeInsets.only(top: 80),
            child: Column(

              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/img.jpg',
                    width: _iconAnimation.value*75,
                    height: _iconAnimation.value*65,
                    fit: BoxFit.fill,
                  ),
                ),
                Form(
                  child: Theme(data: ThemeData(
                      brightness: Brightness.dark, primarySwatch: Colors.teal,
                      inputDecorationTheme: InputDecorationTheme(
                          labelStyle: TextStyle(
                              color: Colors.cyanAccent, fontSize: 20.0
                          )
                      )
                  ),
                    child: Container(
                      padding: EdgeInsets.only(right: 30, left: 30, top: 10),
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Username",
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              labelText: "Enter Password",
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true, //to make entered password invisible
                          ),
                          Padding(padding: EdgeInsets.only(top: 20),),
                          RaisedButton(
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: Text("Login"),
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(builder:
                                (context) => LoggedIn()),);
                              })
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
class LoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Was   If")
      ),
      body: Stack(
          fit: StackFit.expand,
          children: [
            Image(
              image: AssetImage("assets/wasifbackground.jpg"),
              fit: BoxFit.cover,
              color: Colors.black87,
              colorBlendMode: BlendMode.darken,
           ),
            Center(
              child:Text("Welcome to the world of App development",
                  textAlign: TextAlign.center ,
                  style: TextStyle(fontSize: 30,color: Colors.white70,))
      )])
    );
  }
}
