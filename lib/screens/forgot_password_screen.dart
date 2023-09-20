import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () => Navigator.of(context).pop()),
        ),
        body: SingleChildScrollView(
          child:Padding(padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 100),
                    child: Form(
                        key: formKey,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(bottom: 35.0),
                            child: Text(
                              "Forgot your password ",
                              style: TextStyle(fontSize: 25.0, color:
                              Colors.purple[600]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 35.0),
                            child: Text(
                              "Send the correct email to have the password sent to you  ",
                              style: TextStyle(fontSize: 16.0, color: Colors.grey),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 10.0),
                            padding: EdgeInsets.only(left: 20.0, right: 20.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(25.0)),
                            child: TextFormField(
                              decoration: InputDecoration(
                                  hintText: "your email",
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.email),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.purpleAccent, width: 1),
                                    borderRadius: BorderRadius.all(Radius.circular(10),
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.purple, width: 2),
                                    borderRadius: BorderRadius.all(Radius.circular(10),
                                    ),
                                  ),
                              ),
                              validator: (value) {
                                const pattern = r'(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)';
                                final  regExp = RegExp(pattern);
                                if (value!.isEmpty) {
                                  return 'Enter an email';
                                }
                                else if (!regExp.hasMatch(value!)) {
                                  return 'Enter a valid email';
                                }

                                else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.emailAddress,
                              controller: emailController,
                              onSaved: (emailController) => setState(() => emailController =
                              emailController!),
                            ),
                          ),
                          MaterialButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  print("successFully");
                                  emailController.clear();
                                }
                              },
                              child: Container(
                                alignment: Alignment.center,
                                width: MediaQuery.of(context).size.width,
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                                margin: EdgeInsets.only(bottom: 10.0, top: 30.0),
                                padding: EdgeInsets.all(2.0),
                                decoration: BoxDecoration(
                                    color: Colors.purple[600],
                                    borderRadius: BorderRadius.circular(25.0)),
                              )),
                        ],
                      ),
                    )),

            ),

        );
  }
}