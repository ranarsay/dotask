import 'package:flutter/material.dart';



class Body extends StatelessWidget {

  static const route = "/body";


  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

        return Scaffold(
          body: Container (
              height: _height,
              width: _width,
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child:SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: _height * 0.3),
                  Image.asset("assets/dotask_logo.png", height: 100),
                  SizedBox(height: _height * 0.025),
              
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text("Hi there! Nice to see you.", 
                textAlign: TextAlign.center,
                
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  
                  ),
                  
                ),
              
                
              ),
              SizedBox(height: _height * 0.035),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: Text("SIGN IN"),
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue),
                    
                  ),
                 onPressed:(){
                Navigator.of(context).pushNamed("/signIn");
                },
                  color: Colors.blue,
                  textColor: Colors.black
                  
                ),
                
                ),
                SizedBox(height: _height * 0.010),
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: RaisedButton(
                  child: Text("SIGN UP"),
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(15.0),
                    side: BorderSide(color: Colors.blue),
                    
                  ),
                 onPressed:(){
                Navigator.of(context).pushNamed("/signUp");
                },
                  color: Colors.blue,
                  textColor: Colors.black
                  
                ),
                
                ),
              

                ],),
              ),
  
             
                        
                      )

                  
                
          

            
         
     
    );
  }
}