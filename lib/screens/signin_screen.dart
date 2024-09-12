import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:game_shop/const.dart';
import 'package:game_shop/screens/main_screen.dart';
import 'package:game_shop/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreen();
}

class _SignInScreen extends State<SignInScreen> {
  bool ischange = false;
  bool isShowUse = false;

  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _UsernameController.dispose();
    _PasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: BottomSection,
          ),
        ),
      ),
    );
  }

  List<Widget> get BottomSection {
    return [
      appbarsection(),
      const SizedBox(
        height: 30,
      ),
      const Text(
        "Sign in Now",
        style: TextStyle(
            color: primaryColor, fontSize: 30, fontWeight: FontWeight.bold),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          // email
          validator: (value) {
            if (value!.isEmpty) {
              return "Can Not be Empty";
            }
          },
          controller: _UsernameController,
          keyboardType: TextInputType.name,
          decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.person,
              color: primaryColor,
            ),
            hintText: "Username",
            // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade900, width: 2),
                borderRadius: BorderRadius.circular(50)),
          ),
          obscureText: false,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(20),
        child: TextFormField(
          validator: (value) {
            if (value!.isEmpty) {
              return "can Not be Empty";
            }
          },
          controller: _PasswordController,
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
            // contentPadding: EdgeInsets.symmetric(horizontal: 20 , vertical: ),
            prefixIcon: const Icon(
              Icons.lock_outline,
              color: primaryColor,
            ),
            hintText: "Password",
            // contentPadding: const EdgeInsets.symmetric(horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isShowUse = !isShowUse;
                  });
                },
                icon: isShowUse
                    ? const Icon(
                        Icons.remove_red_eye_outlined,
                        color: primaryColor,
                      )
                    : const Icon(
                        Icons.visibility_off,
                        color: primaryColor,
                      )),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.shade900, width: 2),
                borderRadius: BorderRadius.circular(50)),
          ),
          obscureText: isShowUse,
        ),
      ),
      Row(
        children: [
          Checkbox(
              activeColor: primaryColor,
              value: ischange,
              onChanged: (state) {
                setState(() {
                  ischange = state!;
                });
              }),
          const Text(
            "Remember me",
            style: TextStyle(fontFamily: "roboto"),
          ),
          const Spacer(), // Add Spacer here to push the button to the right
          TextButton(
            style: TextButton.styleFrom(foregroundColor: primaryColor),
            onPressed: () {},
            child: const Text(
              "Forgot Password?",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
      MainSection()
    ];
  }

  Column MainSection() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 25,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              fixedSize: const Size(300, 45),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          onPressed: () {
            if (_formKey.currentState!.validate() && ischange) {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
            } else {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    title: const Text("Warining !"),
                    content: const Text("You don\'t choose remember me"),
                    actions: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor,
                            fixedSize: const Size(300, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "return",
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  );
                },
              );
            }
          },
          child: const Text(
            "Sign in",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        const Text(
          "Don\'t have an Account ?",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            ));
          },
          child: const Text(
            "Create account",
            style: TextStyle(fontSize: 15, color: primaryColor),
          ),
        ),
      ],
    );
  }

  Column appbarsection() {
    return Column(
      children: [
        ClipPath(
          clipper: OvalBottomBorderClipper(),
          child: Container(
            height: 200,
            width: double.infinity,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  Center(
                    child: Image.asset(
                      "assets/images/hkh.png",
                      width: 120,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
