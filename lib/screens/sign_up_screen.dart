import 'package:chat/screens/signin_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignUpScreen> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
  final CopassController=TextEditingController();
   final usernameController=TextEditingController();
  bool passToggle=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      backgroundColor: Colors.white,

      body:SingleChildScrollView(
        child:Padding(padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 100),
          child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,//st
                children: [
                  Container(
                    //child: Image.asset('image'),
                    height: 180,
                    child: Icon(Icons.person_add_rounded, size: 170,
                        color: Colors.purple,),

                  ),
                  const SizedBox(height: 20,)
            ,TextFormField(
                    textAlign: TextAlign.center,
            decoration: InputDecoration(
             // border: InputBorder.none,
              labelText: 'Full Name',
              hintText: 'Enter Full Name',
              contentPadding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10),
                ),
              ),
                prefixIcon: Icon(Icons.person,
                  color: Colors.black38.withOpacity(0.5),),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:Colors.purple,width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(10),
                    ),
                  ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.purpleAccent, width: 1),
                borderRadius: BorderRadius.all(Radius.circular(10),
                ),
                  ),
              ),
                    validator: (value) {
                      if (value!.length < 4) {
                        return 'Enter at least 4 characters';
                      } else {
                        return null;
                      }
                    },
                    controller: usernameController,
                    maxLength: 30,
                    obscureText:passToggle,
                    onSaved: (usernameController) => setState(() =>
                    usernameController = usernameController!),

            ),
///////////////////////////////////
                  const SizedBox(height: 20,),
                  TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value) {},
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter your Email',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
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
                      // else if (value!.contains('#')) {
                      //  return 'Error input';
                      //  }
                      else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    obscureText:passToggle,
                    onSaved: (emailController) => setState(() => emailController =emailController !),
                  ),

                  //////
                  const SizedBox(height: 20),
                  TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value){},
                    decoration: InputDecoration(
                        labelText: 'Passeord',
                        hintText: 'Enter your Passeord',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        enabledBorder:  OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.purpleAccent,width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        prefixIcon: Icon(Icons.lock),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color:Colors.purple,width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10),
                          ),
                        ),
                        suffixIcon: InkWell(
                          onTap: (){
                            setState(() {
                              passToggle=!passToggle;
                            });
                          },
                          child: Icon(passToggle?Icons.visibility:Icons.visibility_off),
                    ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a Password';
                      }
                      else if (passController.text.length < 8) {
                        return 'Password must be at least 8 characters long';
                      }
                      else {
                        return null;
                      }
                    },
                      onSaved: (passController) => setState(() => passController =
                      passController!),
                    keyboardType: TextInputType.phone,
                    controller: passController,
                    obscureText:passToggle, //true,
                    // obscuringCharacter: '.',
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textAlign: TextAlign.center,
                    onChanged: (value){},
                    decoration: InputDecoration(
                      labelText: 'Confirm Passeord',
                      hintText: ' Confirm Passeord',
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      enabledBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.purpleAccent,width: 1),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color:Colors.purple,width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10),
                        ),
                      ),
                      suffixIcon: InkWell(
                        onTap: (){
                          setState(() {
                            passToggle=!passToggle;
                          });
                        },
                        child: Icon(passToggle?Icons.visibility:Icons.visibility_off),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Enter a Password';
                      }
                      else if (CopassController.text.length !=passController.text.length ) {
                        return 'The password is not the same';
                      }
                      else {
                        return null;
                      }
                    },
                      onSaved: (CopassController) => setState(() => CopassController
                      = CopassController!),
                    keyboardType: TextInputType.phone,
                    controller: CopassController,
                    obscureText:passToggle, //true,
                    // obscuringCharacter: '.',
                  ),
                  const SizedBox(height: 30,),
                  /* MyButton(color: Colors.purple,
                    title: 'SignIn',*/
                  InkWell(
                    onTap: () {
                      //final isValid = formKey.currentState!.validate();
                      if (formKey.currentState!.validate()) {
                        print("successFully");
                        emailController.clear();
                        passController.clear();
                        CopassController.clear();
                        usernameController.clear();

                        /* FocusScope.of(context).unfocus();
                         if (isValid) {
                        formKey.currentState!.save();
                        final message =
                            ' Password: $password\nEmail: $email';
                        final snackBar =
                       SnackBar(
                         content: Text(
                           message,
                            ste: TextStyle(fontSize: 20),
                          ),
                         backgroundColor: Colors.green,
                       );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);*/

                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Center(
                        child: Text(
                          'Create Account',
                          style: TextStyle(color: Colors.white,fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),

                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account?",style: TextStyle(
                          fontSize: 17),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap:(){
                       Navigator.push(context,MaterialPageRoute(
                         builder: (context)=>SignInScreen(),
                         ));},
                      child: Text("Sign In",
                        style:TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent),
                      ),
                      )

                  ]),

                ],
              )
          ),

        ),
      ),
    );
  }
}
