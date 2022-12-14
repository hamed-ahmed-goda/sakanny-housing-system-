import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sakkeny/screens/login_screen.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ForgetThree extends StatefulWidget {
  static const String routeName = 'forget_three';
  final String code;

  const ForgetThree({Key? key,required this.code}) : super(key: key);

  @override
  State<ForgetThree> createState() => _ForgetThreeState();
}

class _ForgetThreeState extends State<ForgetThree> {
  bool notvisible = true;
  bool notvisible2 = true;
  String? pass1 ;
  String? pass2;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool validate() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cPasswordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backwardsCompatibility: false,
        elevation: 0,
        backgroundColor: Colors.white,

        systemOverlayStyle:
            SystemUiOverlayStyle(statusBarColor: Color(0xff1f95a1)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  Text(
                    'Forget Password',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'change your password',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xff1f95a1),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: Column(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 7),
                                  //  spreadRadius: 50.0,
                                )
                              ],
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller: passwordController,
                                textInputAction: TextInputAction.next,
                                obscureText: notvisible,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        notvisible = !notvisible;
                                      });
                                    },
                                    icon: notvisible
                                        ? Icon(
                                            Icons.visibility,
                                            color: Color(0xff1f95a1),
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Color(0xff1f95a1),
                                          ),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff1f95a1),
                                  ),
                                  //  labelText: "Enter Your  First Name",
                                  labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: "Enter Your Password",
                                ),
                                validator: (val) {
                                  pass1=val;
                                  if (val!.length == 0)
                                    return "Please enter password";
                                  else if (val.length <5 )
                                    return "password must be at least 6 ";
                                  else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Confirm Password",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                letterSpacing: 2),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 20.0,
                                  offset: Offset(0.0, 7),
                                  //  spreadRadius: 50.0,
                                )
                              ],
                            ),
                            child: Container(
                              color: Colors.white,
                              child: TextFormField(
                                controller:cPasswordController,
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: notvisible2,
                                decoration: InputDecoration(
                                  errorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  focusedErrorBorder: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                        color: Colors.white, width: 0.0),
                                  ),
                                  suffixIcon: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        notvisible2 = !notvisible2;
                                      });
                                    },
                                    icon: notvisible2
                                        ? Icon(
                                            Icons.visibility,
                                            color: Color(0xff1f95a1),
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: Color(0xff1f95a1),
                                          ),
                                  ),
                                  enabledBorder: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Color(0xff1f95a1),
                                  ),
                                  //  labelText: "Enter Your  First Name",
                                  labelStyle: TextStyle(color: Color(0xff1f95a1)),
                                  focusedBorder: OutlineInputBorder(
                                    // borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  hintText: "Confirm Your Password",
                                ),
                                validator: (val) {
                                  pass2=val;
                                  if (val!.length == 0)
                                    return "Please confirm your password";
                                  else if(pass1 != pass2)
                                    return "password not the same";
                                  else
                                    return null;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 40),
                child: Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Color(0xff1f95a1),
                  child: MaterialButton(
                    child: Text(
                      'Change',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      if(validate())
                        {
                          changePassword(passwordController.text, cPasswordController.text,widget.code);

                        }

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Future<void> changePassword(password,cPassword,code) async {
    Map data = {
      "password":password,
      "cPassword":cPassword,
    };
    print(data.toString());
    Response response = await http.post(
      Uri.parse('https://graduation-api.herokuapp.com/admin/newPassword/$code'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    var _data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(_data['message']);
      print('code send to this gmail');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Code send")));
     if(true){
       showDialog(
           context: context,
           barrierDismissible: false,
           builder: (context) => Dialog(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(15)),
             elevation: 16,
             child: ClipRRect(
               borderRadius: BorderRadius.circular(5),
               child: Container(
                 width: 600,
                 height: 450,
                 child: Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.only(
                           left: 40.0,
                           right: 40,
                           bottom: 20,
                           top: 20),
                       child: Image.asset(
                         "images/changepass.png",
                         fit: BoxFit.cover,
                       ),
                     ),
                     Text(
                       "Your password",
                       style: TextStyle(
                           fontSize: 19,
                           fontWeight: FontWeight.bold),
                     ),
                     Padding(
                       padding: const EdgeInsets.only(
                           bottom: 15.0),
                       child: Text(
                         "has been successfully changed",
                         style: TextStyle(
                             fontSize: 19,
                             fontWeight: FontWeight.bold),
                       ),
                     ),
                     Padding(
                       padding:
                       const EdgeInsets.only(top: 15.0),
                       child: RaisedButton(
                         color:
                         Color(0xff1f95a1), // background
                         shape: RoundedRectangleBorder(
                             borderRadius:
                             BorderRadius.circular(
                                 10)), // foreground
                         onPressed: () {
                           Navigator.of(context).pushAndRemoveUntil(
                               MaterialPageRoute(builder: (context) => LoginScreen()), (route) => false);
                         },
                         child: Padding(
                           padding:
                           const EdgeInsets.all(10.0),
                           child: Text(
                             "Login",
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 25),
                           ),
                         ),
                       ),
                     )
                   ],
                 ),
               ),
             ),
           ));
     }
    } else {
      print(_data['message']);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong Email"),
      ));
    }

  }
}
