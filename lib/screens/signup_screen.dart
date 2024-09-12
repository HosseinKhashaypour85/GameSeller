import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:game_shop/screens/main_screen.dart';
import 'package:game_shop/screens/signin_screen.dart';
import '../const.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreen();
}

class _SignUpScreen extends State<SignUpScreen> {
  bool isShowUse = false;
  bool secondisShowUse = false;
  bool isChecked = false;

  final TextEditingController _UsernameController = TextEditingController();
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PasswordController = TextEditingController();
  final TextEditingController _ReapeatPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _UsernameController.dispose();
    _EmailController.dispose();
    _PasswordController.dispose();
    _ReapeatPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Expanded(
            flex: 3,
            child: Column(
              children: [
                appbarsection(context),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  "Create account",
                  style: TextStyle(
                    color: primaryColor,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can not Be empty";
                      }
                    },
                    controller: _UsernameController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade900,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: const Icon(
                        Icons.person,
                        color: primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Username",
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can not Be empty";
                      }
                    },
                    controller: _EmailController,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade900,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      prefixIcon: const Icon(
                        Icons.email,
                        color: primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Email",
                    ),
                    keyboardType: TextInputType.name,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can not Be empty";
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade900,
                          width: 2,
                        ),
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
                                  Icons.remove_red_eye,
                                  color: primaryColor,
                                )
                              : const Icon(Icons.visibility_off)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Password",
                    ),
                    keyboardType: TextInputType.name,
                    obscureText: isShowUse,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Can not Be empty";
                      }
                    },
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade900,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              secondisShowUse = !secondisShowUse;
                            });
                          },
                          icon: secondisShowUse
                              ? const Icon(
                                  Icons.remove_red_eye,
                                  color: primaryColor,
                                )
                              : const Icon(Icons.visibility_off)),
                      prefixIcon: const Icon(
                        Icons.lock,
                        color: primaryColor,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      hintText: "Repeat password",
                    ),
                    obscureText: secondisShowUse,
                    keyboardType: TextInputType.name,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Checkbox(
                        activeColor: primaryColor,
                        value: isChecked,
                        onChanged: (state) {
                          setState(() {
                            isChecked = state!;
                          });
                        },
                      ),
                      const Text(
                        "I agree to the",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "terms and rules",
                          style: TextStyle(
                            fontSize: 15,
                            color: primaryColor,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        fixedSize: const Size(300, 50),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate() && isChecked) {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignInScreen(),
                            ),
                          );
                        } else {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Warning !"),
                                content: const Text(
                                    "You are not agree with our rules"),
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
                                      "Ok !",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                ],
                              );
                            },
                          );
                        }
                      },
                      child: const Text(
                        "sign up",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  "Already have an account ?",
                  style: TextStyle(color: Colors.grey),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Sign in from here",
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget appbarsection(BuildContext context) {
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
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                ),
                Center(
                  child: Image.asset(
                    "assets/images/hkh.png",
                    width: 130,
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
