import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
   CreateAccountScreen({super.key});
  static const String RouteName = "createAccount";

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  GlobalKey<FormState>formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/Frame 1.png",
          fit: BoxFit.fill,
          width: double.infinity,
          height: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent,
            title: Text(
              "create Account",
              style: TextStyle(color: Colors.white),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Form(key: formKey,
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                Spacer(
                  flex: 7,
                ),
                TextFormField(
                  validator: (text) {
                    if(text!.isEmpty || text == ""){
                      return "Please Enter First Name" ;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "First Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                Spacer(),
                TextFormField(
                  validator: (text) {
                    if(text!.isEmpty|| text == ""){
                      return "Please Enter Last Name" ;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Last Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                Spacer(),
                TextFormField(validator: (text) {
                  if(text!.isEmpty|| text == ""){
                    return "Please Enter User Name" ;
                  }
                  return null;
                },
                  decoration: InputDecoration(
                      hintText: "User Name",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                Spacer(),
                TextFormField(
                  validator: (text) {
                    if(text!.isEmpty|| text == ""){
                      return "Please Enter Email " ;
                    }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(text);
                    if(!emailValid){
                      return "Please Enter Valid Email" ;
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Email",
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                Spacer(),
    TextFormField(
    validator: (text) {
    if (text!.isEmpty) {
    return "Please Enter Password";
    }
    RegExp regex =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (!regex.hasMatch(text)) {
    return 'Enter valid password';
    }
    return null;
    },
    decoration: InputDecoration(
    hintText: "Password",
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: Colors.blue),
    ),
    suffixIcon: IconButton(
    icon: Icon(
    _obscureText ?  Icons.visibility_off:Icons.visibility,
    ),
    onPressed: _togglePasswordVisibility,
    ),
    ),
    keyboardType: TextInputType.text,
    obscureText: _obscureText,
    ),
                Spacer(
                  flex: 2,
                ),
                ElevatedButton(
                    style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Colors.blue),
                    elevation:WidgetStateProperty.all(6) ,
                   padding: WidgetStateProperty.all(EdgeInsets.symmetric(vertical: 20,horizontal: 50))
                     ),

                    onPressed:() {createAccount();

                } , child: Text("Create Account",style: TextStyle(color: Colors.white),)),
                Spacer(flex: 4,)
              ],

            )),
          ),
        ),
      ],
    );
  }

  void createAccount(){
    if(formKey.currentState!.validate()){
      print("Account Added");
    }
  }

   bool _obscureText = true;

   void _togglePasswordVisibility() {
     setState(() {
       _obscureText = !_obscureText;
     });
   }
}
