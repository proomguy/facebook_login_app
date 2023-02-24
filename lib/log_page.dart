import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_flogin/login_controller.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  loginPageUI(){
    return Consumer<LoginController>(builder: (context, model, child){
      if(model.userDetails != null){
        return Center(
          child: alreadyLoggedInScreen(model),
        );
      }
      else{
        return notLoggedInScreen();
      }
    });
  }

  alreadyLoggedInScreen(LoginController model){

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: Image.network(model.userDetails!.photoURL ?? "").image,
          radius: 100,
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person,
              color: Colors.blueAccent,
              ),
            SizedBox(width: 20,),
            Text(
              model.userDetails!.displayName ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.email,
              color: Colors.blueAccent,
            ),
            SizedBox(width: 20,),
            Text(
              model.userDetails!.email ?? "",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.white
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        ActionChip(
          backgroundColor: Colors.red,
          avatar: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Icon(Icons.login_outlined, color: Colors.white,),
          ),
          label: Padding(
            padding: EdgeInsets.only(left: 15.0, right: 15.0),
            child: Text("log Out",
              style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          onPressed: (){
            Provider.of<LoginController>(context, listen: false).allowUserToSignOut();
          },
        ),
      ],
    );

  }

  notLoggedInScreen(){
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(30.0),
            child: Image.asset("assets/facebook.png"),
          ),
          GestureDetector(
            child: Image.asset("assets/fb.png", width: 240,),
            onTap: (){
              Provider.of<LoginController>(context, listen: false).allowUserToSignInWithFB();
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: loginPageUI(),
    );
  }
}
