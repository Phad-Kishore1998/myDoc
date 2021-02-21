import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_doc/Start.dart';
import 'package:firebase_core/firebase_core.dart';


class HomePage2 extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage2> {

  @override
  void initState(){
    super.initState();
    Firebase.initializeApp().whenComplete(() { 
      print("completed");
      this.checkAuthentification();
      this.getUser();
    });
  }
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User user;
  bool isloggedin= false;


  checkAuthentification() async{

    FirebaseAuth.instance.authStateChanges().listen((user) { 

      if(user ==null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (context)=> Start()));
      }
    });
  }
  

  getUser() async{

    User firebaseUser = await _auth.currentUser;
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser;

    if(firebaseUser !=null)
    {
      setState(() {
        this.user =firebaseUser;
        this.isloggedin=true;
      });
    }
  }

  signOut()async{

    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


     body: Container(
       child: !isloggedin? CircularProgressIndicator(): 
       
       Column(
         children: <Widget>[

           SizedBox(height: 40.0),

           Container(

            height: 300,
            child: Image(image: AssetImage("images/welcome.jpg"),
            fit: BoxFit.contain,
          ),
        ),     
            Container(
              child: Text("Hello ${user.displayName} you are Logged in as ${user.email}",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),),
            ),

            RaisedButton(

               padding: EdgeInsets.fromLTRB(70,10,70,10),
                      onPressed: signOut,
                      child: Text('Signout',style: TextStyle(

                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                      
                      )),

                      color: Colors.orange,
                      shape: RoundedRectangleBorder(

                        borderRadius: BorderRadius.circular(20.0),
                      ),
            )
        ],
       ),
     )

    );
  }
}