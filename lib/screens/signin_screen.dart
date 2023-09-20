import 'package:chat/screens/forgot_password_screen.dart';
import 'package:chat/screens/sign_up_screen.dart';
import 'package:chat/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}
class _SignInScreenState extends State<SignInScreen> {
  final formKey=GlobalKey<FormState>();
  final emailController=TextEditingController();
  final passController=TextEditingController();
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
                  child: Icon(Icons.mark_unread_chat_alt_outlined, size: 170,
                      color: Colors.purple),
                ),

///////////////////////////////////
               const SizedBox(height: 50,),
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

                    else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  onSaved: (emailController) => setState(() => emailController =
                  emailController!),
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
                   )
                   //\ suffixIcon: Icon(Icons.visibility_off),
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
                //  onSaved: (value) => setState(() => password = value!),
                  keyboardType: TextInputType.phone,
                  controller: passController,
                  obscureText:passToggle, //true,
                 // obscuringCharacter: '.',
                ),
                SizedBox(
                  height: 15,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen()));
                  },
                  child: Text(
                    "Forgot Password ?",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.purple[400],fontWeight:FontWeight.normal,
                      //  fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ),
                const SizedBox(height: 15,),
               /* MyButton(color: Colors.purple,
                    title: 'SignIn',*/
            InkWell(
                   onTap: () {
                      //final isValid = formKey.currentState!.validate();
                      if (formKey.currentState!.validate()) {
                        print("successFully");
                        emailController.clear();
                        passController.clear();
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
                    'LogIn',
                    style: TextStyle(color: Colors.white,fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

                ),

                SizedBox(height: 5,),
                Text("or",style:TextStyle(fontSize: 15,color: Colors.purple[800],),
                  textAlign:TextAlign.center ,
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account? ",style: TextStyle(
                        fontSize: 18,),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap:(){
                        Navigator.push(context,MaterialPageRoute(
                          builder: (context)=>SignUpScreen(),
                        ));},
                      child: Text("Sign Up",
                        style:TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.purpleAccent),
                      ),
                    )
                  ],
                )

              ],
        )
        ),

      ),
      ),
    );
  }
}
