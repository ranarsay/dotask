
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'homepage.dart';
import 'todo_screen.dart';
import 'shopping_list.dart';
import 'list_screen.dart';
import 'goals.dart';
import 'motivation.dart';
import 'TodayScreen.dart';

class UserProfile extends StatefulWidget {

    static const route = "/profile";

  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

 

  List userProfilesList = [];
  String userID ="";

  @override
  void initState() {
    super.initState();
    fetchUserInfo();
  }

  fetchUserInfo() async {
    User getUser =  FirebaseAuth.instance.currentUser;
    userID=getUser.uid;
  }

  

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SideMenuState> stateMenu = GlobalKey<SideMenuState>();
    return SideMenu(
      key: stateMenu,
      background: Color.fromRGBO(23, 106, 198, 1),
      type: SideMenuType.slide,
      menu: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: const EdgeInsets.only(
              left: 20,
              top: 20,
              bottom: 20,
            ),
            
              ),
            
              BuiltTileWidget(
                title: "Profile",
                iconData: Icons.person,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(UserProfile.route);
            },
              ),
              BuiltTileWidget(
                title: "Today",
                iconData: Icons.calendar_view_day,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(TodayScreen.route);
            },
              ),
              BuiltTileWidget(
                title: "Shopping List",
                iconData: Icons.shopping_bag_rounded,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(ShoppingScreen.route);
            },
              ),
              BuiltTileWidget(
                title: "To do",
                iconData: Icons.done_all,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(TodoScreen.route);
            },
              ),
              BuiltTileWidget(
                title: "Lists",
                iconData: Icons.list,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(ListScreen.route);
            },
              ),
              BuiltTileWidget(
                title: "Goals",
                iconData: Icons.auto_awesome,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(GoalsScreen.route);
            },
              ),
              BuiltTileWidget(
                title: "Get Motivated",
                iconData: Icons.favorite_border,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(Motivation.route);
            },
              ),
              Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
            BuiltTileWidget(
                title: "Logout",
                iconData: Icons.exit_to_app,
                 onTap: () {
              Navigator.of(context).pushReplacementNamed(Homepage.route);
            },
              ),
                
          ],
          ),
      ),

    child: Scaffold(
      appBar: AppBar(
      title: Text("Profile", style: TextStyle(color:Color.fromRGBO(23, 106, 198, 1))),
      backgroundColor: Colors.white,
        leading: IconButton(
            icon: Icon(Icons.menu), color:Color.fromRGBO(23, 106, 198, 1) ,
            onPressed: (){
              final _state = stateMenu.currentState;
              if (_state.isOpened)
                  _state.closeSideMenu(); 
                else
                  _state.openSideMenu();
            },
            ),
    
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("profileInfo").doc(userID).snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData) 
          return Align(
                alignment: FractionalOffset.center,
                child: CircularProgressIndicator(),
              );

            return Column(
              children: <Widget> [
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image(image: AssetImage("assets/background.jpg")),
                    Positioned(child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/profileimage.png"),
                    )),
                    
                  ],
                ),
                SizedBox(height: 20),

                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text(snapshot.data["name"] + " " +snapshot.data["surname"], style: TextStyle(fontSize: 25, )),),
                  ListTile(
                    title: Text(snapshot.data["email"]),
                    leading: Icon(Icons.mail),
                  ),

                    ],
              
               
            );

          },

      ),
      
      
    )
    );
  }

  

          
      }
      
  

  

class BuiltTileWidget extends StatelessWidget {

  final String title;
  final Function onTap;
  final IconData iconData;

  const BuiltTileWidget({Key key, this.title, this.onTap, this.iconData});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: TextStyle(color: Colors.white, fontSize: 16),),
      leading: Icon(iconData, color: Colors.white,),
      onTap: onTap,
    );
  }
}